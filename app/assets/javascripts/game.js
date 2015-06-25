$(document).ready(function(){
	game.createAndShowField(); 
	$('.field_position').droppable({
		accept: '.player_image'
	});
	$('.player_image').draggable({
		snap: ".field_position", 
		snap: ".roster td",
		revert: 'invalid'
	});
	$('.roster td').droppable({
		accept: '.player_image'
	});
	$('.player_image').dblclick(function(event) {
		var player = event.target
		$('#modal_form').modal('show');
		$('.event_button').click(function(event){
			var data = {
				player_id: parseInt(player.id),
				game_id: parseInt(event.target.name),
				stat_options: parseInt(event.target.value)
			};
			console.log(parseInt(player.id));
			console.log(parseInt(event.target.name));
			console.log(parseInt(event.target.value));
			$.ajax({
				type: "POST",
				url: "/statistics",
				data: data,
				success: function(response) {
					$("#notifications").append(response);
				},
				dataType: "html"
			});
			$('#modal_form').modal('hide');
		});
		$(".player_image").off("dblclick", ".player_image");
	});
	$('.player_image').tooltip();
});

var game = {
	width: 30,
	height: 20,
	createAndShowField: function () {
	    // build Table HTML
	    var tablehtml = '';
	    for (var h=0; h<this.height; h++) {
	      tablehtml += "<tr id='row+" + h + "'>";
	      for (var w=0; w<this.width; w++) {
	        tablehtml += "<td class='field_position' data-status='dead' id='" + w + "-" + h + "'></td>";
	      }
	      tablehtml += "</tr>";
	    }

	    var goltable = document.createElement("tbody");
	    goltable.attr = "width"
	    goltable.innerHTML = tablehtml;
	    $('#football_field').append(goltable);
	    
	    // once html elements are added to the page, attach events to them
	    this.setupBoardEvents();
	  },
	forEachCell: function (func) {
	    for (var i = 0; i < this.height; i++) {
	      for (var j = 0; j < this.width; j++) {
	        func($("#"+ j + "-" + i), j, i);
	      }
	    }
	  },
	  toggleCell: function(cell) {
	    var $c = $(cell);
	    if ($c.attr('data-status') == 'dead') {
	      $c.attr({ 'data-status': 'alive', 'class': 'alive' });
	    } else {
	      $c.attr({ 'data-status': 'dead', 'class': 'dead' });
	    }
	  },
 	clearBoard: function () {
	    var clearCell = function(cell) {
	      $(cell).attr({ 'data-status': 'dead','class': 'dead' });
	    };
	    this.forEachCell(clearCell);
	},
	setupBoardEvents: function() {
    var onBoardDblClick = function (event) {
      var cell = event.toElement;
    };
    $('#football_field').dblclick(onBoardDblClick.bind(this));
  },
};