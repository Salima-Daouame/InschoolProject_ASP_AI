<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="listeparents.aspx.cs" Inherits="InschoolProject_ASP_AI_New_.listegarents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Gestion Les Tuteurs des Étudiants </h1>

    </div>

    <div style="background-color: white">
        <!-- div1 -->
        <div class="row" style="color: white">
            <!-- div2 -->
            <div class="col-md-3">
                <div style="width: 100%" id="card_response">
                    <a id="start-record-btn" title="Start Recording" style="width: 100%; height: 100%">
                        <center>

                            <img src="img/win.png" style="max-height: 90px" id="image_mic" />
                            <img src="img/loading2.gif" style="max-height: 90px; display: none" id="gif_mic" />

                        </center>
                    </a>
                    <asp:TextBox ID="txt_requette1" runat="server" TextMode="MultiLine" BorderColor="Green" Style="height: 500px; width: 100%;" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txt2" runat="server" TextMode="MultiLine" BorderColor="Green" Style="height: 100px; width: 100%;" Visible="true"></asp:TextBox>
                     <asp:TextBox ID="txt_vocal1" runat="server" Style="visibility: visible; height: 50px;"></asp:TextBox>
                </div>
                <img src="img/wing.gif" style="max-height: 90px; display: none" id="img_loading" />

            </div>
           

        </div>
        <!-- div2 OnRowDataBound="GridView1_RowDataBound"  -->

      <!--  <div style="height: 200px"></div> -->
        <div class="app" style="visibility: inherit">

            <div class="input-single">
                <!-- contient text voice -->

                <!-- contient text voice -->
                <textarea id="note-textarea" placeholder="Create a new note by typing or using voice recognition." style="visibility: hidden; height: 20px"></textarea>
                <asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine" BorderColor="Red" Style="height: 300px" Visible="false"></asp:TextBox>

            </div>

            <div class="row" style="display: none"> 

                <button id="pause-record-btn" title="Pause Recording" style="visibility: visible; color: black">Pause Recognition</button>
                <!--       <button id="save-note-btn" title="Save Etudiant">Save Etudiant</button> -->
                <asp:Button ID="btn2" runat="server" OnClick="btn2_Click" Text="Launch"></asp:Button>
                <p id="recording-instructions">Press the <strong>Start Recognition</strong> button and allow access.</p>

               

            </div>

        </div>
        <!-- div11-->
        <div class="col-md-9">
           
            <hr />
            <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>  
            <!-- GridView1  <asp:BoundField DataField="IdEtudiant"  HeaderText="IdEtudiant" InsertVisible="false" ReadOnly="True" SortExpression="IdEtudiant"/> -->
            <asp:GridView ID="GridView2" CssClass="table table-bordered  table-hover table-responsive"   OnRowEditing = "GridView2_OnRowEditing" OnRowUpdating = "GridView2_OnRowUpdating" OnRowCancelingEdit = "GridView2_OnRowCancelingEdit"  OnRowDeleting="GridView2_OnRowDeleting"   SelectionMode = "FullRowSelect"    runat="server">
              
                <HeaderStyle HorizontalAlign="Justify" CssClass="table table-primary" />
                 
            </asp:GridView>
            <!--GridView1  -->
            <asp:ImageButton ID="btnPdf1" runat="server" ImageUrl="img/pdf.png" Width="32px" Height="32px" Onclick="ButtonPdf1_Click"/> 
             <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img/xls.png" Width="32px" Height="32px" Onclick="Buttonxls1_Click"/> 
             
        </div>
    </div>
    <!-- div1 -->  


      <!-- Script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <script>

        /*  It checks for browser support by trying to access the window.SpeechRecognition object and, if available, 
        creates a new instance of the SpeechRecognition object*/
        try {
            var SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
            var recognition = new SpeechRecognition();
        }
        catch (e) {
            //  console.log("erreur");
            console.error(e);
            $('.no-browser-support').show();    
            $('.app').hide();
        }

        // ids  of input,txtbox...
        var noteTextarea = $('#note-textarea');
        var instructions = $('#recording-instructions');
    var GarantList = $('#notes');


        // inisialize GarantContent par empty string
    var GarantContent = '';

        // Get all Garant from previous sessions and display them.

    var Garant = getAllGarant();
    renderGarant(Garant);

        /*-----------------------------
              Voice Recognition 
        ------------------------------*/

        // If false, the recording will stop after a few seconds of silence.
        // When true, the silence period is longer (about 15 seconds),
        // allowing us to keep recording even when the user pauses. 
        recognition.continuous = true;

        // This block is called every time the Speech APi captures a line. 
        recognition.onresult = function (event) {

            // event is a SpeechRecognitionEvent object.
            // It holds all the lines we have captured so far. 
            // We only need the current one.
            var current = event.resultIndex;

            // Get a transcript of what was said.
            //prend un copier de parole 
            var transcript = event.results[current][0].transcript;

            // Add the current transcript to the contents of our Etudiant.
            // There is a weird bug on mobile, where everything is repeated twice.
            // There is no official solution so far so we have to handle an edge case.
            var mobileRepeatBug = (current == 1 && transcript == event.results[0][0].transcript);
            document.getElementById('card_response').style.display = 'none';
            document.getElementById('img_loading').style.display = 'block';
            if (!mobileRepeatBug) {
                GarantContent += transcript;  //transcript contient un copier de parole 
                //Le contenu de la variable EtudiantContent sera affiché dans la zone de texte,
                noteTextarea.val(GarantContent);
                // in master page sere regenerer un autre id 
                document.getElementById("<%=txt_vocal1.ClientID%>").value = GarantContent;
                // récupère une référence à un élément HTML avec un ID déterminé dynamiquement par les contrôles du serveur web ASP.NET.
                var button = document.getElementById("<%= btn2.ClientID %>");
                button.click();
            }
        };

        /*  recognition.onstart = function () {
               instructions.text('Voice recognition activated. Try speaking into the microphone.');
           }
   
           recognition.onspeechend = function () {
               instructions.text('You were quiet for a while so voice recognition turned itself off.');
           }
   
           recognition.onerror = function (event) {
               if (event.error == 'no-speech') {
                   instructions.text('No speech was detected. Try again.');
               };
           }*/

        /*-----------------------------
              App buttons and input 
        ------------------------------*/

        $('#start-record-btn').on('click', function (e) {
            if (GarantContent.length) {
               GarantContent += ' ';
            }
            //bax mnin nkliki 3la micro mayb9ax yban o tabn l3iyba dyal loading
            document.getElementById('image_mic').style.display = 'none';
            document.getElementById('gif_mic').style.display = 'block';
            recognition.start();
        });


        



        GarantList.on('click', function (e) {
            e.preventDefault();
            var target = $(e.target);

            // Listen to the selected Etudiant.
            if (target.hasClass('listen-note')) {
                var content = target.closest('.Garant').find('.content').text();
                readOutLoud(content);
            }

        });



        /*-----------------------------
              Speech Synthesis 
        ------------------------------*/

        /*  function readOutLoud(message) {
              var speech = new SpeechSynthesisUtterance();
  
              // Set the text and voice attributes.
              speech.text = message;
              speech.volume = 1;
              speech.rate = 1;
              speech.pitch = 1;
  
              window.speechSynthesis.speak(speech);
          }*/

        /*-----------------------------
              Helper Functions 
        ------------------------------*/
        //In summary, this function generates HTML markup for rendering a list of students. If there are students in the provided Etudiant array, it creates a list item for each student with details such as the date, a link to listen to the student, and a link to delete the student. If there are no students, it displays a message indicating the absence of any students.
        //The generated HTML markup is then inserted into the GarantList element


        ///////////// fonction kat5alini nrecordy
    function renderGarant(Garant) {
            var html = '';
        if (Garant.length) {
            Garant.forEach(function (Garant) {
                    html += `<li class="note">
        <p class="header">
          <span class="date">${Garant.date}</span>
          <a href="#" class="listen-note" title="Listen to Garant">Listen to Garant</a>
          <a href="#" class="delete-note" title="Delete">Delete</a>
        </p>
        <p class="content">${Garant.content}</p>
      </li>`;
                });
            }
            else {
            html = '<li><p class="content">You don\'t have any Garant yet.</p></li>';
            }
           GarantList.html(html);
        }

        /*      function saveEtudiant(dateTime, content) {
                  localStorage.setItem('Garant' + dateTime, content);
              }*/
        ///////////// fonction kat5alini nrecordy aussi 
    function getAllGarant() {
        var Garants = [];
            var key;
            for (var i = 0; i < localStorage.length; i++) {
                key = localStorage.key(i);

                if (key.substring(0, 2) == 'Garant') {
                    Garants.push({
                        date: key.replace('Garant', ''),
                        content: localStorage.getItem(localStorage.key(i))
                    });
                }
            }
        return Garants;
        }


        /*      function deleteEtudiant(dateTime) {
                  localStorage.removeItem('Etudiant' + dateTime);
              }*/

    </script>
    <!-- Script -->






</asp:Content>
