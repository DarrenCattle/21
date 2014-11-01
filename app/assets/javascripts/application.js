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

jQuery(function($) {
	$("#link-complete").click(function(e) {
    	e.preventDefault();
    	$(this).replaceWith('<form accept-charset="UTF-8" action="/challenges/update_days" data-remote="true" method="post"><div style="display:none"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"></div> 						<input class="button complete" id="button-complete" name="commit" type="submit" value="Done"> <input id="message" name="message" type="text" value=""><br> </form>');
	});

	$("#link-fail").click(function(e) {
    	e.preventDefault();
    	$(this).replaceWith('<form accept-charset="UTF-8" action="/challenges/reset_days" data-remote="true" method="post"><div style="display:none"><input name="utf8" type="hidden" value="✓"><input name="_method" type="hidden" value="put"></div> 						<input class="button fail" id="button-fail" name="commit" type="submit" value="Fail"> <input id="message" name="message" type="text" value=""><br> </form>');
	});
});

