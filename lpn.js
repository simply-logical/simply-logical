/**
 * @fileOverview
 * Embedded SWISH
 *
 * @version 0.2.0
 * @author Jan Wielemaker, J.Wielemaker@vu.nl
 * @requires jquery
 */

(function($) {
  var pluginName = 'LPN';
  var currentSWISHElem = null;
  var database = new Array();
  
  var SWISH = "http://swish.swi-prolog.org/";

  /** @lends $.fn.LPN */
  var methods = {
    _init: function(options) {
    var currentSource = null;
	
    return this.each(function() {
	var elem = $(this);
	var data = {};			/* private data */

	data.swishURL = options.swish || SWISH;

	function appendRunButtonTo(obj) {
	  obj.append("<div class='load'></div>")
	     .on("click", "div.load", function() {
	       toggleSWISH(elem);
	     });

	  return obj;
	}
	
	// Begin edited by TW.
	if( elem.hasClass("temp") ) {
		database[elem.attr("id")] = elem.text();
	}
	// End edit.
	
	if ( elem.hasClass("exercise") ) {
	  currentSource = null;		/* make them independent */
	  if ( elem.find(".swish").length == 0 ) {
	    var run = $("<div>"+
			  "<span>Run Prolog Now!</span>"+
			"</div>");
	    elem.append(run);
	    run.wrap("<div class='open-prolog'></div>");
	    elem = run;
	    appendRunButtonTo(elem.parent());
	  }
	} 
	
	// Begin edited by TW.
	
	else if ( elem.hasClass("answer") ) {
		elem.wrap("<div class='answer'></div>");
		data.answer = elem.attr("answer");
		appendRunButtonTo(elem.parent());
	}
	
	// End edit.
	
	// Begin modified by TW & CH. 
	else if ( elem.hasClass("source") ) {
	  data.queries = [];
	  if ( elem.hasClass("inherit") ) {
        var inherits = elem.attr("inherit-id").split(" ");
        var text = "";
        for (index = 0; index < inherits.length; index++) {
          if(database[inherits[index]]) {
			text += database[inherits[index]];
		  }
        }
		if ( elem.hasClass("query") ) {
			data.queries.push(elem.text(), "\n");
			data.source = text;
		} else {
			data.source = text + elem.text();
		}
	  }
	  else {
		data.source = elem.text();
	  }
	  currentSource = data;
	  elem.wrap("<div class='source'></div>");
	  appendRunButtonTo(elem.parent());
	}
    // End modified.
	
	else if ( elem.hasClass("query") ) {
	  if ( currentSource ) {
	    currentSource.queries.push(elem.text(), "\n");
	  } else {
	    data.queries = [elem.text(), "\n"];
	    elem.wrap("<div class='query'></div>");
	    appendRunButtonTo(elem.parent());
	  }
	} else if ( elem.hasClass("query-list") ) {
	  function addQueries(list) {
	    elem.children().each(function() {
	      var li = $(this);
	      list.push(makeQuery(li.text()));
	    });
	  }

	  if ( currentSource ) {
	    addQueries(currentSource.queries);
	  } else {
	    data.queries = [];
	    addQueries(data.queries);
	    elem.wrap("<div class='query'></div>");
	    appendRunButtonTo(elem.parent());
	  }
	}
	elem.data(pluginName, data);	/* store with element */
      });
    }
  }; // methods

  // <private functions>

  function toggleSWISH(elem) {
    function attr(name, value) {
      content.push(" ", name, '="', value, '"');
    }
	
    var data    = elem.data(pluginName);
	if ( data.swish ) {
      var swish = data.swish;

      delete data.swish;
      currentSWISHElem = null;
      swish.hide(400, function() { swish.remove(); });
      elem.show(400, function() { elem.parent().removeClass("swish"); });
      elem.parent()
	.resizable('destroy')
        .css("height", "auto");
    } else
    { 
	  var query   = data.swishURL;
      var content = [ "<iframe " ];
      var q = "?";
		  
      if ( currentSWISHElem )
		toggleSWISH(currentSWISHElem);

      if ( data.source ) {
		query += q +"code="+encodeURIComponent(data.source);
		q = "&";
      }
	  
      if ( data.queries && data.queries.length > 0 ) {
		query += q + "examples=" + encodeURIComponent(data.queries.join(""));
		q = "&";
      }

      attr("class", "swish");
      attr("src", query);
      attr("width", "100%");
      attr("height", "100%");

      content.push("></iframe>");

	// Edited by TW.
	  if( data.answer ) {
		content = [ "<div " ];
		attr("class", "swish");
		attr("width", "100%");
		attr("height", "100%");
		content.push(">"+ data.answer +"</div>");
	  }
	// End of edit.

      data.swish = $(content.join("")).hide().insertAfter(elem);
      elem.parent().css("height", "300px").resizable({handles:'s'});
      elem.hide(400);
      data.swish.show(400, function() { elem.parent().addClass("swish"); });

      currentSWISHElem = elem;
    }
  }

  /**
   * @returns {String} Query text, which starts with ?- and ends in .\n
   */
  function makeQuery(text) {
    text = text.trim().replace(/\s\s+/g, " ");
    if ( ! /^\?-/.test(text) )
      text = "?- "+text;
    if ( ! /\.$/.test(text) )
      text = text + ".";

    return text+"\n";
  }

  /**
   * <Class description>
   *
   * @class LPN
   * @tutorial jquery-doc
   * @memberOf $.fn
   * @param {String|Object} [method] Either a method name or the jQuery
   * plugin initialization object.
   * @param [...] Zero or more arguments passed to the jQuery `method`
   */

  $.fn.LPN = function(method) {
    if ( methods[method] ) {
      return methods[method]
	.apply(this, Array.prototype.slice.call(arguments, 1));
    } else if ( typeof method === 'object' || !method ) {
      return methods._init.apply(this, arguments);
    } else {
      $.error('Method ' + method + ' does not exist on jQuery.' + pluginName);
    }
  };
}(jQuery));


		 /*******************************
		 *	    CHEAP MODAL		*
		 *******************************/

var modal = (function() {
  var method = {},
  $overlay,
  $modal,
  $content,
  $close;

				// Center the modal in the viewport
  method.center = function () {
    var top, left;

    top = Math.max(window.innerHeight - $modal.outerHeight(), 0) / 2;
    left = Math.max(window.innerWidth - $modal.outerWidth(), 0) / 2;

    $modal.css({ top:top + $(window).scrollTop(),
                 left:left + $(window).scrollLeft()
               });
  };

				// Open the modal
  method.open = function (settings) {
    $content.empty().append(settings.content);

    $modal.css({ width: settings.width || 'auto',
                 height: settings.height || 'auto'
	       });

    method.center();
    $(window).bind('resize.modal', method.center);
    $modal.show();
    $overlay.show();
  };

				// Close the modal
  method.close = function () {
    $modal.hide();
    $overlay.hide();
    $content.empty();
    $(window).unbind('resize.modal');
  };

				// Generate the HTML and add it to the document
  $overlay = $('<div id="overlay"></div>');
  $modal = $('<div id="modal"></div>');
  $content = $('<div id="content"></div>');
  $close = $('<a id="close" href="#">close</a>');

  $modal.hide();
  $overlay.hide();
  $modal.append($content, $close);

  $(document).ready(function() {
    $('body').append($overlay, $modal);
  });

  $close.click(function(e) {
    e.preventDefault();
    method.close();
  });

  return method;

}());
