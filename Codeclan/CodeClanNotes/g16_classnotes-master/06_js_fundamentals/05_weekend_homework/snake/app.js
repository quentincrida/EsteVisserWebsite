let canvas, ctx;
document.addEventListener('DOMContentLoaded', () => {
  canvas = document.querySelector("canvas");
  ctx = canvas.getContext("2d");
  document.addEventListener("keydown", keyDownEvent);
  // render X times per second
  let x = 8;
  setInterval(draw, 1000 / x);
});

// Game Grid
let game = {
  gridSize: 20,
  tileSize: 20,
  nextX: 0,
  nextY:0,
  appleX:15,
  appleY:15
}


// snake
let snake = {
  defaultTailSize: 3,
  tailSize: 3,
  trail: [],
  x: 10,
  y: 10
}

// draw
function draw() {
  // move snake in next pos
  snake.x += game.nextX;
  snake.y += game.nextY;

  // snake over game world?
  if (snake.x < 0) {
    snake.x = game.gridSize - 1;
  }
  if (snake.x > game.gridSize - 1) {
    snake.x = 0;
  }
  if (snake.y < 0) {
    snake.y = game.gridSize - 1;
  }
  if (snake.y > game.gridSize - 1) {
    snake.y = 0;
  }
  //snake bite apple?
  if (snake.x == game.appleX && snake.y == game.appleY) {
    snake.tailSize++;
    game.appleX = Math.floor(Math.random() * game.gridSize);
    game.appleY = Math.floor(Math.random() * game.gridSize);
  }

  //set snake trail
  snake.trail.push({ x: snake.x, y: snake.y });
  while (snake.trail.length > snake.tailSize) {
    snake.trail.shift();
  }

  //paint background
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  // paint snake
  ctx.fillStyle = "green";
  for (trail of snake.trail) {
    ctx.fillRect(
      trail.x * game.tileSize,
      trail.y * game.tileSize,
      game.tileSize,
      game.tileSize
    );

    //snake bites it's tail?
    if (trail.x == snake.x && trail.y == snake.y) {
      snake.tailSize = snake.defaultTailSize;
    }
  }

  // paint apple
  ctx.fillStyle = "red";
  ctx.fillRect(game.appleX * game.tileSize,
    game.appleY * game.tileSize,
    game.tileSize,
    game.tileSize);

}
// input
function keyDownEvent(e) {
  switch (e.keyCode) {
    case 37:
    game.nextX = -1;
    game.nextY = 0;
    break;
    case 38:
    game.nextX = 0;
    game.nextY = -1;
    break;
    case 39:
    game.nextX = 1;
    game.nextY = 0;
    break;
    case 40:
    game.nextX = 0;
    game.nextY = 1;
    break;
  }
}
