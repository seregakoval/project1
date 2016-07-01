<cfif custid EQ "">You need to select customer<cfabort></cfif> 
<cfquery name="getcust" datasource="#dbname#">
	select * from customer where id = '#custid#'
</cfquery> 

<cfquery name="getbranch" datasource="#dbname#">
	select * from branch where id = '#getcust.branch#'
</cfquery>

<cfquery name="getcashbin" datasource="#dbname#">
	select sum(amt) as amt from cashbin_log where usrid = '#custid#'
</cfquery>

<!DOCTYPE HTML>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Page 11</title>
    <link rel="stylesheet" href="../css/ionicons.css">
    <!-- The next file is for the custom scrollbar for iframes -->
    <script src="js/perfect-scrollbar.min.js"></script>

	<style>
		@font-face {
	    font-family: MyriadPro;
	    src: url("../fonts/MyriadPro-Regular.otf") format("opentype");
	    src: url("../fonts/MyriadPro-Regular.woff") format("woff");
			}

		.clear {
		    clear: both;
		}

		body {
		    width: 100%;
		    font-family: MyriadPro;
		    font-size: 11px;
		    line-height: 130%;
		    margin: 0;
		    padding: 0;
		    color: #515e67;
		}

		/* Header styles */

		header {
		    background: #434343;
		    color: white;
		    padding: 5px;
		}

		#top_left{
		    padding: 7px 0;
		    float: left;
		    position: relative;
		}

		#home{
		    background: #202224;
		    width: 1.5em;
		    height: 1.5em;
		    border: 1px solid #ddddde;
		    border-radius: 50%;
		    margin: auto;
		    position: absolute;
		    top: 0;
		    bottom: 0;
		    text-align: center;
		    font-size: 1.4em;
		}

		#home i {
		    display: inline-block;
		    vertical-align: -30%;
		}

		#home:hover {
		    cursor: pointer;
		}

		h1 {
		    display: inline;
		    padding-left: 2em;
		    font-size: 1.4em;
		    margin: 0;
		}

		#top_right {
		    display:inline-block;
		    position:relative;
		    float: right;
		    height: auto;
		}

		#top_right img {
		    height: 30px;
		    width: 30px;
		}

		#greeting{
		    display:inline-block;
		    float: left;
		    margin: 6px 13px 0 0;
		    padding: 3px 6px;
		    color: black;
		    background-color: white;
		    border-radius: 5px;
		}

		/* Right-pointing arrow */

		.arrow_box {
			position: relative;
			background: #ffffff;
		}
		.arrow_box:after {
			left: 100%;
			top: 50%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-left-color: #ffffff;
			border-width: 5px;
			margin-top: -5px;
		}

		#top_right img {
		    display: block;
		    float: right;
		    border-radius: 50%;
		}

		#top_right a {
		    color: black;
		    position:absolute;
		    bottom:0;
		    right:0;
		    background-color: white;
		    border-radius: 50%;
		    text-align: center;
		    width: 12px;
		    height: 12px;
		}

		/* Top right openable menu */

		#top_nav {
		    position: fixed;
		    z-index: 2;
		    right: 10px;
		    top: 55px;
		    background-color: white;
		    margin: 0;
		    padding: 0;
		    box-shadow: 2px 2px 1px #828282,
		                -2px 2px 1px #828282,
		                2px 2px 1px #828282;
		}

		#top_nav:after {
		    bottom: 100%;
			left: 80%;
			border: solid transparent;
			content: " ";
			position: absolute;
			pointer-events: none;
			border-bottom-color: #ffffff;
			border-width: 8px;
			margin-top: -8px;
		}

		#top_nav li {
		    list-style: none;
		    border-bottom: 2px solid #ededed;
		}

		#top_nav li a {
		    display: inline-block;
		    width: calc(100% - 20px);
		    text-decoration: none;
		    color: #47515a;
		    padding: 10px;
		    font-size: 1.2em;
		}

		#top_nav li a:hover {
		    background-color: #ededed;
		}

		/* Page 11 specific layout */

		.left_win {
		    width: 160px;
		    float: left;
		    background-color: #ebebeb;
		    height: calc(100vh - 40px); /* 100% viewport height - header */
		    border-right: 1px solid #e6e6e6;
		    position: relative;
		}

		.right_win {
		    float: right;
		    width: 325px;
		    background-color: #ebebeb;
		    height: calc(100vh - 70px); /* 100% viewport height - header - green line */
		}

		/* Client picture & info */

		#client_picture {
		    display: block;
		    border: 2px solid #b2b1b7;
		    border-radius: 50%;
		    margin: 10px auto;
		    width: 35px;
		    height: 35px;
		}

		.left_win h3 {
		    font-size: 1.2em;
		    text-align: center;
		    color: #3f464c;
		    margin: 10px 0;
		}

		.left_win table {
		    margin: 0 auto;
		    font-size: 1em;
		}

		.left_win table tr td:first-child {
		    padding-right: 30px;
		    color: #9a9fa2;
		}

		.left_win table tr td:last-child {
		    color: #3f464c;
		}

		/* Three central buttons */

		#top_button_wrapper {
		    margin-top: 30px;
		    font-size: 1.2em;
		    text-align: right;
		    color: #3e474e;
		}

		.outer {
		    padding-right: 10px;
		}

		.outer:hover {
		    cursor: pointer;
		    background-color: #cfcfcf;
		}

		#sales:hover + div div{
		    border-top-color: #EBEBEB;
		}

		#payment:hover + div div{
		    border-top-color: #EBEBEB;
		}

		#top_button_wrapper div div {
		    padding: 15px 10px 15px 0;
		    border-top: 1px solid #cfcfcf;
		}

		#submit div {
		    border-bottom: 1px solid #cfcfcf;
		}

		.current_button {
		    color: white;
		    background-color: #77a600 !important;
		}

		.current_button div {
		    border-top: 1px solid #77a600 !important;
		    border-bottom: none !important;
		}

		.current_button + div div {
		    border-top: none !important;
		}

		/* Two bottom left buttons */

		#bottom_button_wrapper {
		    position: absolute;
		    bottom: 0;
		    width: 100%;
		}

		.button1 {
		    float: left;
		    text-align: center;
		    color: #515e67;
		    background-color: #d4d4d4;
		    padding: 5px 0;
		    border-top: 1px solid #c3c3c5;
		    border-right: 1px solid #c3c3c5;
		    width: calc(50% - 1px);
		    height: 35px;
		}

		.button1:hover {
		    cursor: pointer;
		    background-color: #FF9740;
		    border-top-color: #FF9740;
		    color: white;
		}

		#create_new_button {
		    border-right: none;
		    width: 50%;
		}

		.button1 i {
		    font-size: 2em;
		}

		.button1 p {
		    margin: 0;
		}

		/* Central window */

		.central_win {
		    position: relative;
		    float: left;
		    width: calc(100% - 486px);
		    height: calc(100vh - 70px);
		}

		#top_green_center {
		    width: calc(100% - 161px);
		    height: 30px;
		    background-color: #77a600;
		    float: left;
		    position: relative;
		}

		#top_input {
		    margin-top: 5px;
		    margin-left: 10px;
		    box-sizing: border-box;
		    -moz-box-sizing: border-box;
		    -webkit-box-sizing: border-box;
		    padding-left: 25px;
		    height: 20px;
		    width: 30%;
		}

		#top_green_center i {
		    position: absolute;
		    font-size: 2em;
		    left: 13px;
		    top: 15%;
		    color: darkgray;
		}

		/* Custom checkbox */

		input[type=checkbox].css-checkbox {
		    position:absolute;
		    z-index:-1000;
		    left:-1000px;
		    overflow: hidden;
		    clip: rect(0 0 0 0);
		    height:1px;
		    width:1px;
		    margin:-1px;
		    padding:0;
		    border:0;
		}

		input[type=checkbox].css-checkbox + label.css-label {
		    padding-left:18px;
		    height:13px;
		    display:inline-block;
		    line-height:13px;
		    background-repeat:no-repeat;
		    background-position: 0 0;
		    font-size: 1.3em;
			vertical-align:middle;
		    cursor:pointer;
		}

		/* Top right tabs */

		.tabs {
		    width: 324px;
		    height: 30px;
		    background-color: #76a500;
		    float: right;
		    position: relative;
		}

		.tab {
		    float: left;
		    background-color: #95be22;
		    color: white;
		    text-align: center;
		    font-size: 1em;
		    padding: 6px 0;
		    width: 31%;
		    margin-right: 2%;
		    border-top-left-radius: 5px;
		    border-top-right-radius: 5px;
		}

		.tab:hover {
    		cursor: pointer;
		}

		.tabs_wrapper {
		    position: absolute;
		    bottom: 0;
		    width: 100%;
		}

		.selected_tab {
		    background-color: #ebebeb;
		    color: #222a2d;
		}

		/* Right window border */

		.content_wrapper {
		    border-left: 1px solid #d5d5d5;
		    height: 100%;
		    position: relative;
		}

		/* Top right search panel */

		.content_wrapper .top_right_search, #products_content, #services_content, #packages_content{
		    padding: 10px 5px;
		    width: calc(100% - 10px);
		}

		#products_content, #services_content, #packages_content {
			position: absolute;
			top: 45px;
			background-color: #F8F8F8;
		}

		.top_right_search input {
			box-sizing: border-box;
			-moz-box-sizing: border-box;
			-webkit-box-sizing: border-box;
			height: 25px;
			border-radius: 5px;
			border: 1px solid #cccbd9;
		}

		.top_right_search .orange_button {
			padding: 5px 0;
			vertical-align: top;
			font-size: 1.2em;
		}

		#code_field {
			width: 25%;
		}

		#desc_field {
			width: 40%;
		}

		#search_button {
			width: 14%;
		}

		#menu_button {
			width: 18%;
		}

		/* central table */

		#main_table_wrapper {
		    height: calc(100vh - 290px);
		}

		#central_table {
		    width: 100%;
		    font-size: 1em;
		    text-align: center;
		    color: #3e474c;
		}

		#central_table td {
    		padding: 10px;
		}

		#table_header {
		    width: 100%;
		    font-size: 1em;
		    text-align: center;
		    color: #3e474c;
		}

		#table_header td {
		    padding: 10px;
		    background-color: #f8f8f8;
		}

	</style>
	<script>
		function gensales(){

			window.location.href="index.cfm?fuseaction=createsales&custid=" + document.itemform.custid.value + "&type=2";
			//window.location.href='dsp_sales.cfm?custid=' + parent.document.itemform.custid.value;
		}
		
		function scannedItem(){
			if(!e){
				var e = window.event;
			}	
			
			if(e.keyCode == 13){
				var codeno = document.getElementById("top_input").value ;
				var unk = new Date();
				
				var url = "databind/act_checkscan.cfm?codeno=" + codeno + "&unk=" + unk ;
				//prompt('',url);
				if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp=new XMLHttpRequest();
			   	} else {// code for IE6, IE5
					xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			   	}
			   	
			   	xmlhttp.open("GET",url,false);
				xmlhttp.send();
				xmlDoc=xmlhttp.responseXML;
				var x=xmlDoc.getElementsByTagName("returnrow");	
				for (i=0;i<x.length;i++){
					//alert(i);
					var msgerror = x[i].getElementsByTagName("msgerror")[0].childNodes[0].nodeValue;
					var totalsales = x[i].getElementsByTagName("totalsales")[0].childNodes[0].nodeValue;
					if(msgerror == "ok"){
						document.getElementById("totalsales").innerHTML = totalsales ;
						document.getElementById("main_table_wrapper").contentWindow.location.reload();
					} else {
						alert(msgerror);
					}
				}
			}
		}
	</script>
</head>

<body>

    <ul id="top_nav" style="display:none">
        <li><a href="#"><i class="ion-person"></i>&nbsp;&nbsp;Profile</a></li>
        <li><a href="#"><i class="ion-social-usd"></i>&nbsp;&nbsp;Sales</a></li>
        <li><a href="#"><i class="ion-social-buffer"></i>&nbsp;&nbsp;Comission</a></li>
        <li><a href="#"><i class="ion-log-out"></i>&nbsp;&nbsp;Logout</a></li>
    </ul>

    <header>
        <div id="top_left">
            <div id="home">
                <i class="icon ion-ios-home"></i>
            </div>
            <h1>Klientec IBeauty Manager 11</h1>
        </div>

        <div id="top_right">
            <p id="greeting" class="arrow_box">
                Hi, I'm <span>Christine</span>, from MV outlet
            </p>
            <img src="../img/actress_small.jpg"/>
            <a href="#" onclick="show_hide_menu()"><i class="ion-arrow-down-b"></i></a>
        </div>

        <div class="clear"></div>
    </header>

    <div class="left_win">
		
        <img src="../img/actress2.jpg" id="client_picture">
		<form name="itemform">
	        <h3><cfoutput>#getcust.name#</cfoutput></h3>
			<cfoutput>
			<input name="custid" type="hidden" value="#custid#">
	        <table>
	            <tr>
	                <td>ID</td>
	                <td>:&nbsp;#getcust.custno#</td>
	            </tr>
	            <tr>
	                <td>Member</td>
	                <td>:&nbsp;#getcust.membershipno#</td>
	            </tr>
	            <tr>
	                <td>Birthday</td>
	                <td>:&nbsp;#dateformat(getcust.birth,"dd mmm yyyy")#</td>
	            </tr>
	            <tr>
	                <td>Outlet</td>
	                <td>:&nbsp;#getbranch.code#</td>
	            </tr>
	            <tr>
	                <td>&nbsp;</td>
	                <td>&nbsp;</td>
	            </tr>
	            <tr>
	                <td>Cash Bin</td>
	                <td>:&nbsp;#decimalformat(getcashbin.amt)#</td>
	            </tr>
	            <tr>
	                <td>&nbsp;</td>
	                <td>&nbsp;</td>
	            </tr>
	            <tr>
	                <td>Date</td>
	                <td>:&nbsp;#dateformat(now(),"dd mmm yyyy")#</td>
	            </tr>
	            <tr>
	                <td>Time</td>
	                <td>:&nbsp;#timeformat(now(),"HH:mm:ss")#</td>
	            </tr>
	            <tr>
	                <td>&nbsp;</td>
	                <td>&nbsp;</td>
	            </tr>
	            <tr>
	                <td><h4>TOTAL (RM)</h4></td>
	                <td>:&nbsp;<h4><div id="totalsales">0.00</div></h4></td>
	            </tr>
	            <tr>
	                <td>salesid</td>
	                <td>:&nbsp;#nextid#</td>
	            </tr>
	            <tr>
	                <td></td>
	                <td></td>
	            </tr>
	
	        </table>
		</form>
		</cfoutput>
        <div id="top_button_wrapper">
            <div class="outer current_button" id="sales" onclick="switch_buttons(this)">
                <div>
                    SALES&nbsp;&nbsp;&nbsp;<i class="icon ion-android-cart"></i>
                </div>
            </div>
            <div class="outer" id="payment" onclick="switch_buttons(this)">
                <div>
                    PAYMENT&nbsp;&nbsp;&nbsp;<i class="icon ion-cash"></i>
                </div>
            </div>
            <div class="outer" id="submit" onclick="switch_buttons(this)">
                <div>
                    SUBMIT&nbsp;&nbsp;&nbsp;<i class="icon ion-briefcase"></i>
                </div>
            </div>
        </div>


        <div id="bottom_button_wrapper">
            <div class="button1">
                <i class="icon ion-wrench"></i>
                <p>On Hold</p>
            </div>

            <div class="button1" id="create_new_button" onclick="gensales()">
                <i class="icon ion-heart"></i>
                <p>Create New</p>
            </div>
        </div>
        <div class="clear"></div>

    </div>

    <div id="top_green_center">
            <i class="icon ion-ios-barcode"></i>
            <input type="text" id="top_input" onkeyup="scannedItem();">
            <input type="checkbox" id="top_checkbox" class="css-checkbox"><label class="css-label" for="top_checkbox">NL</label>
            <div class="tabs">
                <div class="tabs_wrapper">
                    <div class="tab selected_tab" id="products" onclick="switch_tab(this)">PRODUCTS</div>
                    <div class="tab" id="services" onclick="switch_tab(this)">SERVICES</div>
                    <div class="tab" id="packages" onclick="switch_tab(this)">PACKAGES</div>
                    <div class="clear"></div>
                </div>
            </div>
    </div>

    <div class="central_win">
        <table id="table_header">
            <tr>
                <td width="5%"><i class="icon ion-ios-circle-filled"></i></td>
                <td width="5%">#</td>
                <td width="10%">Code</td>
                <td width="20%">Desc.</td>
                <td width="5%">T</td>
                <td width="5%">S</td>
                <td width="5%">D</td>
                <td width="15%">U/Price</td>
                <td width="7%">Disc</td>
                <td width="7%">Total</td>
                <td width="7%">GSM</td>
                <td width="7%">GSM Total</td>
            </tr>	
        </table>
        <!-- This iframe has custom scrollbar -->
        <cfoutput><iframe src="dsp_saleslist.cfm?nextid=#nextid#"
                    id="main_table_wrapper"
                    frameBorder="0"
                    width="100%"
                    scrolling="yes"></iframe></cfoutput>
        <div id="bottom_panel">
            <iframe src="dsp_posmain_new2.cfm?nextid=#nextid#" width="100%" frameBorder="0"></iframe>
        </div>
    </div>

    <div class="right_win fg">
        <div class="content_wrapper">
            <div class="top_right_search">
				<cfoutput><input type="hidden" id="nextid" value="#nextid#"></cfoutput> 
				<input type="text" id="code_field" placeholder="Code">
                <input type="text" id="desc_field" placeholder="Description">
                <div class="orange_button" id="search_button"><i class="icon ion-search"></i></div>
                <div class="orange_button" id="menu_button"><i class="icon ion-navicon-round"></i></div>
            </div>
            <div id="products_content">
                <!-- This iframe has custom scrollbar -->
                <cfoutput><iframe src="dsp_pop_item.cfm?nextid=#nextid#"
                        id="products_iframe"
                        scrolling="no"
                        frameborder="0"
                        style="width: 100%;
                               height: calc(100vh - 140px)">
                </iframe></cfoutput>
            </div>
            <!--- <div id="services_content" class="hidden">
                <!-- This iframe has custom scrollbar -->
                <iframe src="page11_iframe_services.html"
                        id="services_iframe"
                        scrolling="no"
                        frameborder="0"
                        style="width: 100%;
                               height: calc(100vh - 140px)">
                </iframe>
            </div> --->
            <!--- <div id="packages_content" class="hidden">
                <!-- This iframe has custom scrollbar -->
                <iframe src="page11_iframe_packages.html"
                        id="packages_iframe"
                        scrolling="no"
                        frameborder="0"
                        style="width: 100%;
                               height: calc(100vh - 140px)">
                </iframe>
            </div> --->
        </div>
    </div>

    <script src="js/show_menu.js"></script>
    <script>

        /*function switch_tab(elem){

            var a = document.getElementsByClassName('tab');
            // loop through all 'tab' elements
            for (i = 0; i < a.length; i++) {
                // Remove the class 'selected_tab' if it exists
                a[i].classList.remove('selected_tab')
            }
            // Add class 'selected_tab' to the clicked element
            elem.classList.add('selected_tab');

            switch (elem.id) {
                case "products":
                    document.getElementById("products_content").classList.remove('hidden');
                    document.getElementById("services_content").classList.add('hidden');
                    document.getElementById("packages_content").classList.add('hidden');
                break;

                case "services":
                    document.getElementById("services_content").classList.remove('hidden');
                    document.getElementById("products_content").classList.add('hidden');
                    document.getElementById("packages_content").classList.add('hidden');
                break;

                case "packages":
                    document.getElementById("packages_content").classList.remove('hidden');
                    document.getElementById("products_content").classList.add('hidden');
                    document.getElementById("services_content").classList.add('hidden');
                break;

                default:
                break;
            }

        }*/
        
        function switch_tab(elem){
        	
            var a = document.getElementsByClassName('tab');
            // loop through all 'tab' elements
            for (i = 0; i < a.length; i++) {
                // Remove the class 'selected_tab' if it exists
                a[i].classList.remove('selected_tab')
            }
            // Add class 'selected_tab' to the clicked element
            elem.classList.add('selected_tab');
            
            var nextid = document.getElementById("nextid").value;
            
            switch (elem.id) {
                case "products":
                    //document.getElementById("products_content").classList.remove('hidden');
                    //document.getElementById("services_content").classList.add('hidden');
                    //document.getElementById("packages_content").classList.add('hidden');
                    document.getElementById("products_iframe").src = "dsp_pop_item.cfm?nextid="+nextid;
                break;
                    
                case "services":
                    //document.getElementById("services_content").classList.remove('hidden');
                    //document.getElementById("products_content").classList.add('hidden');
                    //document.getElementById("packages_content").classList.add('hidden');
                    document.getElementById("products_iframe").src = "dsp_pop_service.cfm?nextid="+nextid;
                break;
                    
                case "packages":
                    //document.getElementById("packages_content").classList.remove('hidden');
                    //document.getElementById("products_content").classList.add('hidden');
                    //document.getElementById("services_content").classList.add('hidden');  
                    document.getElementById("products_iframe").src = "dsp_pop_package.cfm?nextid="+nextid;                  
                break;
                    
                default:
                break;
            }
            
        }
        
        function switch_buttons(elem) {
            var a = document.getElementsByClassName('outer');
            // loop through all 'outer' elements
            for (i = 0; i < a.length; i++) {
                // Remove the class 'current_button' if it exists
                a[i].classList.remove('current_button')
            }
            // Add class 'selected_tab' to the clicked element
            elem.classList.add('current_button');
        }
    </script>
    <!-- This script adds custom scrollbar to the iframe (actually to the inner content of the iframe) -->
    <script>
      var iframe = document.querySelector('#main_table_wrapper');
      iframe.onload = function () {
        Ps.initialize(iframe.contentDocument.querySelector('#contentHolder'));
      };
      var iframe2 = document.querySelector('#products_iframe');
      iframe2.onload = function () {
        Ps.initialize(iframe2.contentDocument.querySelector('#contentHolder'));
      };
      var iframe3 = document.querySelector('#services_iframe');
      iframe3.onload = function () {
        Ps.initialize(iframe3.contentDocument.querySelector('#contentHolder'));
      };
      var iframe4 = document.querySelector('#packages_iframe');
      iframe4.onload = function () {
        Ps.initialize(iframe4.contentDocument.querySelector('#contentHolder'));
      };
    </script>
</body>

</html>