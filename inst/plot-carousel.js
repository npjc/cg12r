// !preview r2d3 data = list(list(plate = "S1L1", fill = "red"), list(plate = "S2L1", fill = "orange"))

// level,n,r,arcr,a0
class Carousel {
    constructor(level, n, r, arcr, a0) {
        this.level = level;
        this.n = n;
        this.r = r;
        this.arcr = arcr;
        this.a0 = a0;
    }

    trays() {
      const angles =  [-90, -30, -30, -90, -30, -60];
      const dims = this.trayDims();
      var result = [];
        for (var i = 0; i < this.n; i ++) {

          result.push({
            name: 'S' + (i + 1) + 'L' + this.level,
            width: dims.width,
            height: dims.height,
            x: Math.cos(i * (360 / this.n) * (Math.PI / 180)) * (this.r - dims.width / 2),
            y: Math.sin(i * (360 / this.n) * (Math.PI / 180)) * (this.r - dims.width / 2),
            trayAngle: i * (360 / this.n) - 90,
            r: this.r
          });
        }
        return result;
    }

    getPoint(a, r = this.r) {

        return {
        a: a,
        x: Math.cos(a * Math.PI / 180) * r,
        y: Math.sin(a * Math.PI / 180) * r
       };
    }

    trayDims() {
        let a = 360 / this.n;
        let p1 = this.getPoint(a);
        // arbitrarily chose that a side of a carousel has 60% of angle dedicated to
        // the plate tray and 40% if the angle to the spacer/cutout region.
        let p2 = this.getPoint(a + (a * 0.6));
        let d = Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2));
        // the height is  = 85.48 / 127.76 based on the SBS footprint of 96MTP.
        return {width: d * 0.92, height: d * 0.6691 * 0.92};
    }

    path() {
        var aStep = 360 / this.n;
        let p0 = this.getPoint(this.a0);
        let points = [p0];
        // Move to starting point
        let d = ['M', p0.x, p0.y].join(' ');
        let i = -1;
        while (++i < this.n) {
          // each n gets 2 points. first is tray area (60%) then cutout area (40%)
          let stopAngle1 = this.a0 + aStep * i + (aStep * 0.6);
          let stopPoint1 = this.getPoint(stopAngle1);
          points.push(stopPoint1);
          let stopAngle2 = this.a0 + aStep * i + (aStep * 0.6) + (aStep * 0.4);
          let stopPoint2 = this.getPoint(stopAngle2);
          points.push(stopPoint2);
          // tray area has straight line
          d += [' L', stopPoint1.x, stopPoint1.y].join(' ');
          // followed by arc shaped cutout
          d += [' A', this.arcr, this.arcr, 0, 0, 0, stopPoint2.x, stopPoint2.y].join(' ');
        }
         // close/connect the path
        d += " Z";
        return {d:d, points: points};
    }
}

function constructCarousels(n, parentHeight) {
  const nSides = 6;
  const r = parentHeight / (2 * n);
  const arcr = r / 2.5;
  const a0 = (360 / nSides) * (0.6 / 2) * -1;

  let carousels = [];
  for (var i = 0; i < n; i ++) {
    carousels.push(new Carousel(i + 1, nSides, r, arcr, a0));
  }
  return carousels;
}

class Microplate {
    constructor(nRows, nCols, wellShape) {
        this.rows = this.rowDomain(nRows);
        this.cols = this.colDomain(nCols);
        this.width = 127.76;
        this.height = 85.48;
        this.wellShape = wellShape;
        this.hWellPadding = 10.9;
        this.vWellPadding = 7.76;
        this.iWellPadding = 0.227; // percent
    }

  wells() {
    return d3.cross(this.rows, this.cols, (row, col) => ({row: row, col: col}));
  }

  rowDomain(n) {
    const alphabet = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase().split('');
    return alphabet.slice(0, n);
  }

  colDomain(n) {
    return Array.apply(null, {length: n}).map(Number.call, Number).map(d => d+1)
  }

  xScale() {
    return d3.scaleBand()
                .domain(this.cols)
                .range([0 + this.hWellPadding, this.width - this.hWellPadding])
                .paddingInner(this.iWellPadding);
  }

  yScale() {
    return d3.scaleBand()
                .domain(this.rows)
                .range([0 + this.vWellPadding, this.height - this.vWellPadding])
                .paddingInner(this.iWellPadding)
                .paddingOuter(0);
  }

}

const data2 = constructCarousels(2, height);

const carousels = svg.selectAll('.carousel')
  .data(data2)
  .enter().append('g')
  .attr('class', 'carousel')
  .attr('transform', (d,i) => `translate(${width / 2}, ${i * 2 * d.r + d.r})`);

  carousels.append('path')
  .attr('stroke', 'black')
  .attr('fill', 'none')
  .attr('d', d => d.path().d);

  carousels.append('text')
  .attr('text-anchor', 'middle')
  .text(d => d.level);

const trays = carousels.selectAll('.tray')
    .data(d => d.trays())
  .enter()
  .append('g')
  .attr('class', 'tray')
  .attr('id', d => d.name) // this is unique across viz so ok
  .attr('transform', (d) => `rotate(${d.trayAngle}, ${d.x}, ${d.y}) translate(${d.x - d.width / 2},${d.y - d.height /2})`);

 trays.append('rect')
   .attr('fill','none')
   .attr('stroke-width', 0.25)
   .attr('stroke','black')
   .attr('width', d => d.width)
   .attr('height', d => d.height);

  trays.append('text')
    .text(d => d.name)
    .attr('font-size', 11);

svg.selectAll('g.tray')
  .data(data, function(d) { return d ? d.plate : this.id; })
  .enter()
  .append('text')
  .attr('fill', d => d.fill);


