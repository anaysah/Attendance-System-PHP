<?php
include_once('../templates/header.php');
?>
<?php
require_once('../includes/main.function.inc.php');
isLoged("teacher");
require_once '../includes/dbh.inc.php';
?>

<style>
    .file-drop-inner-box{
        border: 5px dashed skyblue;
        color: var(--fgColor);
        font-weight: bold;
    }
    .active{
        border: 5px solid skyblue;
    }

    .uploaded{
        border: 5px dashed var(--bgColor);
    }
</style>

<div class="container-fluid main-body d-flex">
    <?php include_once("../templates/sidemenu.inc.php"); ?>
    <div class="d-flex align-items-strech flex-column gap-2 flex-grow-1 overflow-x-auto">
        <div class="foreground rounded py-3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="d-flex align-items-center gap-2">
                            <input type="text" class="form-control flex-grow-1 rounded-2 p-1" style="height: 23px;"
                                value="<?= $DOMAIN ?>/includes/joinClass.inc.php?class_code=<?= $class['class_code'] ?>" readonly/>
                            <span class="d-flex gap-1"><span><i
                                        class="fa-solid fa-copy"></i></span><span>copy</span></span>
                        </div>

                        <div>
                            <center>Share this class link with your students to join</center>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <center>O R</center>
        <div class="foreground py-3 rounded">
            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-3 d-flex flex-column align-items-center">
                        <span class="mb-1">Add students by yourself</span>
                        <input type="text" class="form-control flex-grow-1 rounded p-1 mb-2" style="height: 27px;" placeholder="Name"/>
                        <input type="text" class="form-control flex-grow-1 rounded p-1 mb-2" style="height: 27px;" placeholder="Email Id"/>
                        <div class="row g-2">
                            <div class="col-7">
                                <input type="text" class="form-control flex-grow-1 rounded p-1 mb-2" style="height: 27px;" placeholder="Roll No"/>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control flex-grow-1 rounded p-1 mb-2" style="height: 27px;" value="<?=$_COOKIE['class_name']?>" placeholder="Class" disabled/>
                            </div>
                        </div>
                        <input type="submit" name="submit" value="Add" class="btn btn-primary py-0 px-3">
                    </div>
                </div>
            </div>
        </div>
        <center>O R</center>
        <div class="foreground py-3 rounded h-100">
            <div class="container h-100">
                <div class="row h-100 g-1">
                    <div class="col d-flex flex-column gap-2">
                        <div><input class="form-control form-control-sm" id="studentdata_csv" name="student_data" type="file" accept=".csv"></div>
                        <div class="bg-light flex-grow-1 rounded file-drop-box">
                            <div class="h-100 file-drop-inner-box rounded d-flex justify-content-center align-items-center gap-3">
                                <!-- <div class="file-drop-content d-flex align-items-center gap-3"> -->
                                    <img src="/images/csv.png" alt="" srcset="" height="60px">
                                    <span class="d-flex flex-column align-items-center"><span class="file-drop-content-first-line">drag and drop </span><span class="file-drop-content-second-line">csv file here</span></span>
                                <!-- </div> -->
                            </div>
                        </div>
                    </div>
                    <div class="col ">
                        <ul>
                            <li>You can add bunch of students at one time by uploading data of all students in csv file.</li>
                            <li>csv file should contain <b>Name</b>, <b>Email</b> of all students in csv file.</li>
                            <li>including roll no is not mandatory but it will beneficial for you. yes you can change the roll no later if you want</li>
                            <li>here is a sample file for an example</li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    const dragArea = document.querySelector(".file-drop-box");
    const dragInnerArea = document.querySelector(".file-drop-inner-box");
    const dragText1 = document.querySelector(".file-drop-content-first-line");
    const dragText2 = document.querySelector(".file-drop-content-second-line");
    const fileInput = document.getElementById("studentdata_csv");

    //change the text of dragText1 to the file name in fileInput every time
    fileInput.onchange = function() {
        dragText1.textContent = "File selected";
        dragText2.textContent = "";
    };


    dragArea.addEventListener('dragover', (event)=>{
        event.preventDefault();
        dragText1.textContent = "Release to Upload";
        dragInnerArea.classList.add("active");
    })

    dragArea.addEventListener('dragleave', (event)=>{
        dragText1.textContent = "drag and drop ";
        dragInnerArea.classList.remove("active");
    })

    dragArea.addEventListener('drop', (event)=>{
        event.preventDefault();

        let file = event.dataTransfer.files[0];
        //get the type of file
        let fileType = file.type;
        let validExtensions = ["text/csv"];
        if(!validExtensions.includes(fileType)){
            alert("This file type is not allowed");
            dragInnerArea.classList.remove("active");
            return;
        }

        // Set the file to the input
        fileInput.files = event.dataTransfer.files;

        //add class uploaded to dragInnerArea
        dragInnerArea.classList.add("uploaded");
        dragText1.textContent = "File selected";
        dragText2.textContent = "";
        
        // Trigger a change event to update the input state
        const eventChange = new Event('change');
        fileInput.dispatchEvent(eventChange);

    })
    
</script>

<?php include_once("../templates/footer.php"); ?>