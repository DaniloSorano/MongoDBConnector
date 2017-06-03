include "time.iol"

type ObjectId: void {
  .id: string
}

type Point: void {
  .coordinates*: void {
    .lat: double
    .lon: double
  }
}

type Polygon: void {
  .coordinates*: void {
    .lat: double
    .lon: double
  }
}
