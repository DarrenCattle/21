// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

/*smoothscroll*/
jQuery(document).ready(function(e){e(".scroll").click(function(t){t.preventDefault();e("html,body").animate({scrollTop:e(this.hash).offset().top},1e3)})});

// toggle menu sidebar
jQuery(function($) {
	$("#menu-toggle").click(function(e) {
    	e.preventDefault();
    	$("#wrapper").addClass("toggled");
	});
	$("#menu-untoggle").click(function(e) {
    	e.preventDefault();
    	$("#wrapper").removeClass("toggled");
	});
});

// add message when click DONE
jQuery(function($) {
	$("#link-complete").click(function(e) {
    	e.preventDefault();
    	$(this).next().remove();
    	$(this).replaceWith('<form accept-charset="UTF-8" action="/challenges/update_days" data-remote="true" method="post" class="form-inline"><div style="display:none"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"></div> <input id="message" name="message" type="text" value="" placeholder="Enter your message here..." class="form-control"> <input class="button button-primary button-form" id="button-complete" name="commit" type="submit" value="Send"><br> </form>');
	});

// add message when click FAIL
	$("#link-fail").click(function(e) {
    	e.preventDefault();
    	$(this).prev().remove();
    	$(this).replaceWith('<form accept-charset="UTF-8" action="/challenges/reset_days" data-remote="true" method="post" class="form-inline"><div style="display:none"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"></div> <input id="message" name="message" type="text" value="" placeholder="Enter your message here..." class="form-control"> <input class="button button-primary button-form" id="button-fail" name="commit" type="submit" value="Send"><br> </form>');
	});
});

// change font size of challenge and reason depending on length
jQuery(function($){

    var $name = $(".challenge-info-name"); 
    var $numWords = $name.text().split(" ").length;
    
    if (($numWords >= 1) && ($numWords < 10)) {
        $name.css("font-size", "2rem");
    }
    else if (($numWords >= 10) && ($numWords < 20)) {
        $name.css("font-size", "1.5rem");
    }
    else {
        $name.css("font-size", "1.25rem");
    }   
    
});

jQuery(function($){

    var $reason = $(".challenge-info-reason"); 
    var $numWords = $reason.text().split(" ").length;
    
    if (($numWords >= 1) && ($numWords < 10)) {
        $reason.css("font-size", "2rem");
    }
    else if (($numWords >= 10) && ($numWords < 20)) {
        $reason.css("font-size", "1.5rem");
    }
    else {
        $reason.css("font-size", "1.25rem");
    }    
    
});

$(document).on('click', ".comment-bubble",function(e) {
    e.preventDefault();
    $(this).closest(".activity").find(".add-comment").slideToggle();
});


jQuery(function($) {
    $('.like').tooltip();
});
