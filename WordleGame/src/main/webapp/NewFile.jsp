<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wordle</title>
<style>
      :root{
	    --green--background:#6AAA64;
	    --grey--background:#787C7E;
	    --yellow--background:#c9B458;
	    --general--grey:#D3D6DA;
	    --general--black:#000000;
	    --dark--grey:#888888;
      }
		
     *{
				
		 box-sizing:border-box;
      }
      body {
         overflow: hidden;
     }
    #gameContainer{
       height:100vh;
       width:100%;
    }
    #titleContainer{
      text-align:center;
      font-size:35px;
      letter-spacing:1px;
      border-bottom:1px solid var(--general--grey);
      height:6%;
      font-style:bold;
      font-weight:bold;
      padding-top:0px;
      padding-bottom:3px;
      font-family:Copperplate,Times New Roman;
    }
  
    #gridContainer{
       height:48%;
       display:grid;
       width:300px;
       grid-template-columns: repeat(5,53px);
       grid-template-rows:repeat(6,53px);
       text-align:center;
       margin: 11px auto;
       gap:5px 5px;
    }
    
    .gridItemCSS{
        border: 2px solid var(--general--grey) ;
        font-size:28px;
        font-family:Arial;
        font-style:900;
        padding-top:7px;
        
    }
    .addAnimation{
	    animation:0.06s expand;
    }
       
    @keyframes expand{
       50%{
            
               transform:scale(1.2,1.2);
          }
       
     }
     .addborder{
         border: 2px solid var(--dark--grey);
     }  
    
      #messageContainer{
	       height:9%;
	       font-size:25px;
	       letter-spacing:2px;
	       text-align:center;
	       margin: 0 auto;
	       padding:5px 0px;
      
    }
    .messageStyling{
	       background-color:var(--dark--grey);
	       color:white;
	       font:30px;
	       border-radius:4px;
	       padding:3px 3px;
    }
    .winMessageStyling{
	       background-color:var( --green--background);
	       color:white;
	       font:30px;
	       border-radius:4px;
	       padding:3px 3px;
    }
    
    #KeyboardContainer{
	       height:25%;
	       width:500px;
	       display:flex;
	       align-items:center;
	       justify-content:space-around;
	       vertical-align:middle;
	       flex-wrap:wrap;
	       margin:0 auto;
	       padding:0 0;
    }
    
    .alphabetBtnCSS{
	       height:55px;
	       width:43px;
	       border:none;
	       border-radius:6px;
	       margin:0px 1px;
	       background-color:var(--general--grey);
	       color:black;
	       font-size:15px;
	       font-weight:570;
       
    }
    #A{
       margin-left:32px;
    }
    #L{
    
        margin-right:32px;
    
    }
    .SubmitBtnCSS{
        width:74px;
        height:55px;
        border:none;
        border-radius:6px;
        background-color:#D3D6DA;
        color:black;
        font-size:15px;
        font-weight:570;
    }
    .backspaceBtnCSS{
         width:74px;
         height:55px;
         border:none;
         border-radius:6px;
         background-color:#D3D6DA;
	     color:black;
	     font-size:15px;
	     font-weight:570;
    }
  
    .flip{
       animation:0.5s linear flipping;
    }
    
    @keyframes flipping{
      0%{
          transform:rotateX(0deg);
      }
      
      50%{
          transform:rotateX(90deg);
      }
      
      100%{
           transform:rotateX(0deg);
      }
      
    }
    .greyTile{
          background-color:var(--grey--background);
          border:none;
          color:white;
    
    }
    .yellowTile{
         background-color:var(--yellow--background);
         border:none;
         color:white;
    
    }
    .greenTile{
         background-color:var(--green--background);
         border:none;
         color:white;
    }
    
    
</style>
</head>
<body>
   <div id="gameContainer"> 
		    <div id="titleContainer"></div>
		    <div id="gridContainer"></div>
		     <div id="messageContainer"></div>
		    <div id="KeyboardContainer"></div>
   </div> 
     <script>
     
     /**
      * 
      */
      
     
      let columnCounter=0,rowCounter=0;
      let alphabetArray=['Q','W','E','R','T','Y','U','I','O','P',
                         'A','S','D','F','G','H','J','K','L',
                         'Submit','Z','X','C','V','B','N','M',"<<"];
      let userInput=[ [' ',' ',' ',' ',' '],
                      [' ',' ',' ',' ',' '],
                      [' ',' ',' ',' ',' '],
                      [' ',' ',' ',' ',' '],
                      [' ',' ',' ',' ',' '],
                      [' ',' ',' ',' ',' ']
                     ];                   
      //generate wordOfThe Day
      function generateWordleWord(){
    	    console.log("Inside generate word func");
    		var xmlhttp=new XMLHttpRequest();
	        xmlhttp.onreadystatechange=function(){
	       	  if(xmlhttp.readyState==4&&xmlhttp.status==200){
	       		 
	       		  //console.log(xmlhttp.responseText);
	       	  }
	       	 
	        };
	       
	        xmlhttp.open("POST","/WordleGame/WordleControllerServlet",true);
	        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	        xmlhttp.onerror=function(e){
	        	alert("error");
	        };
	     
	        xmlhttp.send("counter=100");//set counter=100 to let servelt know that word has to to be generated
    	  
      }
      
      function createHeader(){
    	  let header= document.getElementById("titleContainer");
          header.innerText="Wordle!";
      }
      generateWordleWord();
      createHeader();
      
      //display the userInput grid
      let gridElement=document.getElementById("gridContainer");
      userInput.forEach((array,rowIndex)=>{ 
    	  //const mainGridItem=document.createElement("div");
    	  //mainGridItem.id='row-'+rowIndex;
          //gridElement.append(mainGridItem);
    	  array.forEach((key,colIndex)=>{
           const gridItem=document.createElement("div");
           gridItem.id='row-'+rowIndex+'-'+ 'column-'+colIndex;
           gridItem.classList.add("gridItemCSS");
           gridItem.innerText=key;
           gridElement.append(gridItem);
    	  })
      }) 
      
      //handle userInput  
       const handleClickEvent=(event)=>{
    	      var action=event.target.id;
    	      switch(action){ 
    	      case "backspace":console.log("Inside switch:backspace"); 
    	    	               deleteAlphabet();
    	    	               break;               
    	      case "Submit":  console.log("Inside switch:Submit"); 
    	                      processWord();
    	                      break;             
    	      default:   displayAlphabet(action);
    	      
    	      }//closing switch   
         };//closing handleClick
      
      //display keyboard
       let myElement=document.getElementById("KeyboardContainer"); 
       alphabetArray.forEach(item=>{
          const btn=document.createElement("button");
          btn.innerText=item;
          btn.addEventListener("click",handleClickEvent);
          if(item==="<<"){
             btn.id="backspace";
             btn.classList.add("backspaceBtnCSS");
          }else if(item==="Submit"){
             btn.id=item;
             btn.classList.add("SubmitBtnCSS");
          }else{
             btn.id=item;
            btn.classList.add("alphabetBtnCSS");
          }
          myElement.append(btn);
         
         })
         
         //handle backspace click event
         function deleteAlphabet(){
        	 if(columnCounter>0&&columnCounter<=5){
        		 columnCounter--;
        		 let updateId='row-'+rowCounter+'-'+'column-'+columnCounter;
                 let updateGridElement=document.getElementById(updateId);
                 updateGridElement.innerText='';
                 updateGridElement.classList.remove("addborder");//remove the border
                 updateGridElement.classList.remove("addAnimation");//remove the animation
        		 userInput[rowCounter][columnCounter]='';//remove element from 2D userInput array
        		 //console.log("deleteAlphabet Function");
        	 } 
         }//closing deleteAlphabet()
         
         function  displayAlphabet(action){
 	    	  if(columnCounter>=0&&columnCounter<5&&rowCounter<6){
 	    	            console.log("Inside displayAlphabet")
		    	    	let updateId='row-'+rowCounter+'-'+'column-'+columnCounter;
		                let updateGridElement=document.getElementById(updateId);
		                updateGridElement.innerText=action;
		                updateGridElement.classList.add("addAnimation");//add userInput effect
		                updateGridElement.classList.add("addborder");//add border to input cells
		                userInput[rowCounter][columnCounter]=action;
		                columnCounter++;
 	    	  }//closing if	 
         }//closing displayAlphabet()
         
         function processWord(){
        	 console.log("Inside ProcessWord");
        	 // add logic to check word match here only
        	 if(columnCounter>=5&&rowCounter<6){
        		 var parameterString="counter="+rowCounter+"&word="+userInput[rowCounter].join("");//Add rowCounter to before forming string from the inputArray 
        		 console.log(parameterString);
        		 var xmlhttp=new XMLHttpRequest();
     	         xmlhttp.onreadystatechange=function(){
     	       	    if(xmlhttp.readyState==4&&xmlhttp.status==200){
     	       		    //console.log(xmlhttp.responseText);
     	       		     processResult(xmlhttp.responseText);
     	       	     }
     	       	 
     	        };
     	        xmlhttp.open("POST","/WordleGame/WordleControllerServlet",true);
     	        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
     	        xmlhttp.onerror=function(e){
     	        	alert("error");
     	        };
     	        xmlhttp.send(parameterString);//sending rowcounter along to identify the call is only to check if word exists in list not to generate new word
        	 }//closing if 
         }//closing processWord()
         
         function processResult(responseString){
        	        let flashMessage=document.getElementById("messageContainer");
        	        let message=document.createElement("span");
                     if(responseString.indexOf("N")===0){// N represents word not in list
                    	 console.log("inside processResult");
                    	 message.innerText='Word Not in List!';
                    	 message.classList.add("messageStyling");
                    	 flashMessage.append(message);
                    	 setTimeout(()=>flashMessage.removeChild(message),2000);//the message disappears after few seconds
                     }else if(responseString.indexOf("W")===0){//W represents exact match
                    	 message.innerText='You Win!';
                    	 message.classList.add("winMessageStyling");
                    	 processGrid(responseString);//
                    	 setTimeout(()=>{
                        	 flashMessage.append(message); 
                    	 },2800);//2800 - to display message after all the grid and keyboard alphabets has been revealed
                    	 rowCounter=100;//user should not be able to enter input after winning
                    	 columnCounter=100;//user should not be able to enter input after winning
                     }else{
                    	 //userinput is valid word but not exact match
                    	 processGrid(responseString);
             
                    	 if(rowCounter>=5){
                    		 message.innerText='Game Over';//if user has reached last row display game over
                        	 message.classList.add("messageStyling");
                        	 setTimeout(()=>{
                            	 flashMessage.append(message);
                        	 },2800);
                    		 rowCounter=100;//user should not be able to enter input after Game Over
                        	 columnCounter=100;//user should not be able to enter input after Game Over
                        	 return 
                    	 }else{
                    		 rowCounter++;//if its valid word and not the last row,move to next row to accept input
                        	 columnCounter=0; 
                    	 } 
                     }//closing if        	 
        	 
         }//closing processWord
         function processGrid(responseString){
        	 var inputString=userInput[rowCounter].join('');
        	 for(let index=0,col=0,row=rowCounter;index<5;index++,col++){//declare variables using let, to set scope for variable for setTimeout function
        			setTimeout( ()=>{
        			 let gridElementUpdate=document.getElementById('row-'+row+'-'+'column-'+col);
        			 gridElementUpdate.classList.add("flip");
        			 if(responseString.charAt(index)==='Z'){
            			 gridElementUpdate.classList.add("greyTile");	 
            		 }else if(responseString.charAt(index)==='Y'){
            			 gridElementUpdate.classList.add("yellowTile");
            		 }else{
            			 gridElementUpdate.classList.add("greenTile");
            		 }
        			 
        			},500*index);	//multiply by index to make revealing of grid items one after other,if time is not multiplied by index- reveal of all 5 grid items happen at once  
        	 }//closing for loop
        	 //below for loop is to reveal keyboard alphabets
        	 for(let i=0;i<5;i++){
        		    setTimeout(()=>{
	        	        let buttonUpdate=document.getElementById(inputString.charAt(i));
						 if(responseString.charAt(i)==='Z'){
			    			 buttonUpdate.classList.add("greyTile"); 
			    		 }else if(responseString.charAt(i)==='Y'){
			    			 buttonUpdate.classList.add("yellowTile"); 
			    		 }else{
			    			 buttonUpdate.classList.add("greenTile");
			    		 }
        		    },500*i );
        		 
        	 }//closing forEach loop
        	  
         }//processGrid

      
     </script>
     
 
  
    
</body>
</html>