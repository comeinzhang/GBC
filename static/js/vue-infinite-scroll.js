!function(){var t="@@InfiniteScroll";Function.prototype.bind||(Function.prototype.bind=function(t){if("function"!=typeof this)throw new TypeError("Function bind fail");var e=Array.prototype.slice.call(arguments,1),n=this,i=function(){},o=function(){return n.apply(this instanceof i&&t?this:t,e.concat(Array.prototype.slice.call(arguments)))};return i.prototype=this.prototype,o.prototype=new i,o});var e=function(t,e){var n,i,o,r,l,c=function(){t.apply(r,l),i=n};return function(){if(r=this,l=arguments,n=Date.now(),o&&(clearTimeout(o),o=null),i){var t=e-(n-i);t<0?c():o=setTimeout(function(){c()},t)}else c()}},n=function(t){return t===window?Math.max(window.pageYOffset||0,document.documentElement.scrollTop):t.scrollTop},i=function(t){for(var e=t;getComputedStyle&&e&&"HTML"!==e.tagName&&"BODY"!==e.tagName&&1===e.nodeType;){var n=getComputedStyle(e).overflowY;if("scroll"===n||"auto"===n)return e;e=e.parentNode}return window},o=function(t){return t===window?document.documentElement.clientHeight:t.clientHeight},r=function(t){return t===window?n(window):t.getBoundingClientRect().top+n(window)},l=function(t){for(var e=t.parentNode;e;){if("HTML"===e.tagName)return!0;if(11===e.nodeType)return!1;e=e.parentNode}return!1},c=function(t){var e=this.scrollEventTarget,i=this.el,l=this.distance;if(t===!0||!this.disabled){var c=n(e),a=c+o(e),s=!1;if(e===i)s=e.scrollHeight-a<=l;else{var u=r(i)-r(e)+i.offsetHeight+c;s=a+l>=u}s&&this.expression&&this.expression()}},a=function(){if(!this.binded){this.binded=!0;var t=this,n=t.el;t.scrollEventTarget=i(n),t.scrollListener=e(c.bind(t),200),t.scrollEventTarget.addEventListener("scroll",t.scrollListener);var o=n.getAttribute("infinite-scroll-disabled"),r=!1;o&&(this.vm.$watch(o,function(e){t.disabled=e,!e&&t.immediateCheck&&c.call(t)}),r=Boolean(t.vm[o])),t.disabled=r;var l=n.getAttribute("infinite-scroll-distance"),a=0;l&&(a=Number(t.vm[l]||l),isNaN(a)&&(a=0)),t.distance=a;var s=n.getAttribute("infinite-scroll-immediate-check"),u=!0;s&&(u=Boolean(t.vm[s])),t.immediateCheck=u,u&&c.call(t);var d=n.getAttribute("infinite-scroll-listen-for-event");d&&t.vm.$on(d,function(){c.call(t)})}};Vue.directive("InfiniteScroll",{bind:function(e,n,i){e[t]={el:e,vm:i.context,expression:n.value};var o=arguments;e[t].vm.$on("hook:mounted",function(){e[t].vm.$nextTick(function(){l(e)&&a.call(e[t],o),e[t].bindTryCount=0;var n=function(){e[t].bindTryCount>10||(e[t].bindTryCount++,l(e)?a.call(e[t],o):setTimeout(n,50))};n()})})},unbind:function(e){e[t].scrollEventTarget.removeEventListener("scroll",e[t].scrollListener)}})}();