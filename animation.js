
			function init(){
			  window.requestAnimationFrame(draw);
			}

			function draw() {
			  var ctx = document.getElementById('canvas').getContext('2d');

			  ctx.globalCompositeOperation = 'destination-over';
			  ctx.clearRect(0,0,300,300); // clear canvas

			  ctx.fillStyle = 'rgba(0,0,0,0.4)';
			  ctx.strokeStyle = 'rgba(0,153,255,0.4)';
			  // ctx.save();
			  // ctx.translate(150,150);
			  // Earth
			  var time = new Date();
			  // ctx.rotate( ((2*Math.PI)/60)*time.getSeconds() + ((2*Math.PI)/60000)*time.getMilliseconds() );			 
			  // ctx.drawImage(sun,0,0,300,300);

			  window.requestAnimationFrame(draw);
			}

			var particle = {
			  x: 500,
			  y: 500,
			  vx: 5,
			  vy: 2,
			  radius: 25,
			  color: 'blue',
			  draw: function() {
			    ctx.beginPath();
			    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
			    ctx.closePath();
			    ctx.fillStyle = this.color;
			    ctx.fill();
			  }
			};
			init();