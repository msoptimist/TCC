/* Script:SpringerLink%20native%20promotions - ScriptInstance:d8058b265c5c4ee488b93f948d7d0f5e - CompiledAt:2018-06-29 09:23:32 */

(function(){var compiledTemplate0="";templates();window.NATIVEADS=window.NATIVEADS||{};window.NATIVEADS_QUEUE=window.NATIVEADS_QUEUE||[];var q=function(){return window.NATIVEADS_QUEUE};q().push(["setPropertyID","NA-SPRI-11239270"]);q().push(["insertPreview",{label:"Native promotion",unit:{server:"dfp-gpt",elementID:"doubleclick-native-ad"},location:"#doubleclick-native-ad",infoText:"",infoButtonText:"",template:compiledTemplate0,onRender:function($element,data){},onFill:function(data){},onError:function(error){}}]);q().push(["injectCSS","","head"]);function templates(){compiledTemplate0=function(Handlebars,depth0,helpers,partials,data){this.compilerInfo=[4,">= 1.0.0"];helpers=this.merge(helpers,Handlebars.helpers);data=data||{};var buffer="",stack1,functionType="function",escapeExpression=this.escapeExpression,helperMissing=helpers.helperMissing,self=this;function program1(depth0,data){var buffer="",stack1,options;buffer+='\n      		<img class="u-hide u-show-small u-cols-4-small" alt="'+escapeExpression((stack1=(stack1=depth0.image,stack1==null||stack1===false?stack1:stack1.caption),typeof stack1===functionType?stack1.apply(depth0):stack1))+'" src="';options={hash:{width:230,height:154},data:data};buffer+=escapeExpression((stack1=helpers.getThumbHref||depth0.getThumbHref,stack1?stack1.call(depth0,options):helperMissing.call(depth0,"getThumbHref",options)))+'"/>\n  		';return buffer}buffer+='<section class="c-native-promotions" id="native-promotions">\n    <h2 class="c-native-promotions__heading">';if(stack1=helpers.title){stack1=stack1.call(depth0,{hash:{},data:data})}else{stack1=depth0.title;stack1=typeof stack1===functionType?stack1.apply(depth0):stack1}buffer+=escapeExpression(stack1)+'</h2>\n\n    <div class="u-grid-container-full">\n        <p class="u-cols-8-small u-mt-0">';if(stack1=helpers.summary){stack1=stack1.call(depth0,{hash:{},data:data})}else{stack1=depth0.summary;stack1=typeof stack1===functionType?stack1.apply(depth0):stack1}buffer+=escapeExpression(stack1)+'\n          <a class="c-button c-button--blue c-native-promotions__cta" href="';if(stack1=helpers.link){stack1=stack1.call(depth0,{hash:{},data:data})}else{stack1=depth0.link;stack1=typeof stack1===functionType?stack1.apply(depth0):stack1}buffer+=escapeExpression(stack1)+'">Learn more</a>\n        </p>\n        ';stack1=helpers["if"].call(depth0,depth0.getThumbHref,{hash:{},inverse:self.noop,fn:self.program(1,program1,data),data:data});if(stack1||stack1===0){buffer+=stack1}buffer+="\n    </div>\n</section>";return buffer}}})();(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=d.location.protocol;if(d.getElementById(id)){return}js=d.createElement(s);js.id=id;js.type="text/javascript";js.async=true;js.src=(p=="https:"?p:"http:")+"//plugin.mediavoice.com/plugin.js";fjs.parentNode.insertBefore(js,fjs)})(document,"script","nativeads-plugin");
