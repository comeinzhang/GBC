function me_pic(){
	this.init.apply(this,arguments);
}
me_pic.prototype = {

	init:function(clas){
		var _this = this;
		this.wrap = typeof clas === "string" ? document.getElementById(clas) : clas;
		this.oul = this.wrap.getElementsByTagName("ul")[0];
		this.li = this.oul.getElementsByTagName("li");
		this.Sort = [];
		this.prev = this.wrap.getElementsByTagName("i")[0];
		this.next = this.wrap.getElementsByTagName("i")[1];
		this._donext = function(){return _this.donext.apply(_this)};
		this._doprev = function(){return _this.doprev.apply(_this)};
		var midWidth = resize(860).width;
		var midMargin = -parseInt(midWidth)/2;
		var rightMargin1 = midWidth - resize(774).width ;
		var rightMargin2 = resize(860).width - resize(676).width ;
		$("#remark").css('height', resize(860,540).height);

		function resize(w,h,t,l,z){
			return {
				width: parseInt(w/1920*document.documentElement.clientWidth),
				height: parseInt(w/1920*document.documentElement.clientWidth*h/w),
				top: t,
				marginLeft: parseInt(midMargin+l),
				zIndex: z
			}
		}

		this.option = [
			resize(676, 424, 60, -130, 1),
			resize(774, 486, 32, -67, 2),
			resize(860, 540, 0, 0, 3),
			resize(774, 486, 32, 67+rightMargin1, 2),
			resize(676, 424, 60, 130+rightMargin2, 1)
		];
//li元素存入数组
		for(var i=0;i<this.li.length;i++){this.Sort[i]=this.li[i];}
		this.setup();
		this.addevent(this.next,'click',this._donext); //通过事件直接调用this指向该事件对象，所以通过this._donext做中间 保证this指向me_pic
		this.addevent(this.prev,'click',this._doprev);

	},
	donext:function(){
		this.Sort.push(this.Sort.shift());//数组转换 实现滚动动画
		this.setup();
	},
	doprev:function(){
		this.Sort.unshift(this.Sort.pop());
		this.setup();
	},
	setup:function(){
		var _this=this;
		for(var i=0;i<this.Sort.length;i++){this.oul.appendChild(this.Sort[i]);}
		for(var i=0;i<this.Sort.length;i++){
			this.css(this.Sort[i],'display','block');
			this.domove(this.Sort[i],this.option[i],function(){
			});
		}
	},
	addevent:function(element,type,fun){
		return element.addEventListener ? element.addEventListener(type,fun,false) : element.attachEvent('on' + type,fun);
	},
	css:function(element,attr,value){
		if(arguments.length == 2){
			return element.currentStyle ? element.currentStyle[attr] : getComputedStyle(element, null)[attr];
		}else if(arguments.length == 3){
			switch(attr){
				case "width":;
				case "height":;
				case "marginLeft":;
				case "top":;
				case "bottom":
					element.style[attr]=value+"px";
					break;
				case "opacity":
					element.style.filter = "alpha(opacity=" + value + ")";
					element.style.opacity = value/100;
					break;
				default:
					element.style[attr]=value;
					break;
			}
		}
	},
	domove:function(element,attr,callback){
		var _this=this;
		clearInterval(element.time);
		element.time=setInterval(function(){
			var Stop = true;
			for(var propert in attr){
				var iCur = parseInt(_this.css(element,propert));
				propert == "opacity" && (iCur = parseInt(iCur.toFixed(2) * 100));
				var iSpeed = (attr[propert] - iCur) / 5;
				iSpeed = iSpeed > 0 ? Math.ceil(iSpeed):Math.floor(iSpeed);
				if(iCur != attr[propert]){
					Stop = false;
					_this.css(element,propert,iCur + iSpeed);
				}
			}
			if(Stop){
				clearInterval(element.time);
				callback && callback.apply(_this,arguments);
			}
		},30);
	}
}
window.onload = function ()
{
	new me_pic('remark');
};