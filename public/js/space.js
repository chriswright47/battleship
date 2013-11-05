function Space(location) {
  this.location = location;
  this.hits = 0;
  this.icon = '-';
}

Space.prototype.hit = function() {
  this.hits = 1;
  this.icon = 'X';
}

Space.prototype.miss = function() {
  this.icon = 'O';
}

