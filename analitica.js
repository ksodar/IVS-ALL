$(document).ready(function(){
    $('.product-thumb .btn.btn-primary').click(function(){
      yaCounter43209884.reachGoal('klik-v-korziny');
      ga('send', 'pageview', '/klik-v-korziny'); 
      setTimeout(function(){
	    $('.list-unstyled .btn.btn-link').click(function(){
	      yaCounter43209884.reachGoal('klik-bistrij-zakaz');
	      ga('send', 'pageview', '/klik-bistrij-zakaz'); 
	      setTimeout(function(){
	      	$('.modal-dialog.modal-dialog-order .modal-content .buttons .btn.btn-primary').click(function(){
		      yaCounter43209884.reachGoal('usp-zakaz');
		      ga('send', 'pageview', '/usp-zakaz'); 
		      console.log('/usp-zakaz');
		    });
	      },1000);
	    });
  	  },1000);
    });

    $('.btn-group #button-cart').click(function(){
      yaCounter43209884.reachGoal('klik-v-korziny');
      ga('send', 'pageview', '/klik-v-korziny'); 
      setTimeout(function(){
	    $('.list-unstyled .btn.btn-link').click(function(){
	      yaCounter43209884.reachGoal('klik-bistrij-zakaz');
	      ga('send', 'pageview', '/klik-bistrij-zakaz'); 
	      setTimeout(function(){
	      	$('.modal-dialog.modal-dialog-order .modal-content .buttons .btn.btn-primary').submit(function(){
		      yaCounter43209884.reachGoal('usp-zakaz');
		      ga('send', 'pageview', '/usp-zakaz'); 
		    });
	      },1000);
	    });
  	  },1000);
    });

    $('#product .btn.btn-link').click(function(){
      yaCounter43209884.reachGoal('klik-bistrij-zakaz');
      ga('send', 'pageview', '/klik-bistrij-zakaz'); 
    });

    $('.product-thumb .btn.btn-default').click(function(){
      yaCounter43209884.reachGoal('klik-bistrij-zakaz');
      ga('send', 'pageview', '/klik-bistrij-zakaz'); 
    });

    $('#contacts .dropdown-toggle').click(function(){
      setTimeout(function(){
	    $('.dropdown-menu.opened button[type="button"]').click(function(){
	      yaCounter43209884.reachGoal('klik-zakaz-zvonka');
	      ga('send', 'pageview', '/klik-zakaz-zvonka'); 
	      setTimeout(function(){
	        $('.modal-dialog.modal-dialog-callback .modal-content .buttons .btn.btn-primary').submit(function(){
		      yaCounter43209884.reachGoal('ysp-zakaz-zvonka');
		      ga('send', 'pageview', '/ysp-zakaz-zvonka'); 
		    });
		  },1000);
	    });
  	  },1000);
    });
});