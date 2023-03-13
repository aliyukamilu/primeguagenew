<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

function check_db_query_staus($db_state, $db_actions)
{
    include "config/index.php";
    $query_User_re = sprintf($db_state);
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    switch ($db_actions) {
        case 'DEL':
            if ($User_re) {
                $returnResponse = ['status' => 1, 'message' => "Deleted successfully"];
                return ($returnResponse);
            } else {
                $returnResponse = ['status' => 0, 'message' => "try again"];
                return ($returnResponse);
            }
            break;
        case 'UPD':
            if ($User_re) {
                $returnResponse = ['status' => 1, 'message' => "Updated successfully"];
                return ($returnResponse);
            } else {
                $returnResponse = ['status' => 0, 'message' => "try again"];
                return ($returnResponse);
            }
            break;
        case 'CHK':
            $row_User_re = mysqli_fetch_assoc($User_re);
            $totalRows_User_re = mysqli_num_rows($User_re);

            if ($User_re) {
                if ($totalRows_User_re > 0) {
                    $arr = ['status' => 1, 'message' => $row_User_re];
                    return ($arr);
                } else {
                    $returnResponse = ['status' => 0, 'message' => "try again"];
                    return ($returnResponse);
                }
            } else {
                $returnResponse = ['status' => 0, 'message' => "try again"];
                return ($returnResponse);
            }
            break;

        default:
            break;
    }
}

function check_db_query_staus1($db_state, $db_actions)
{
    include "config/index.php";
    $query_User_re = sprintf($db_state);
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    $totalRows_User_re = mysqli_num_rows($User_re);
    switch ($db_actions) {
        case 'DEL':
            if ($User_re) {
                $returnResponse = ['status' => 1, 'message' => "Deleted successfully"];
                return ($returnResponse);
            } else {
                $returnResponse = ['status' => 0, 'message' => "try again"];
                return ($returnResponse);
            }
            break;
        case 'UPD':
            if ($User_re) {
                $returnResponse = ['status' => 1, 'message' => "Updated successfully"];
                return ($returnResponse);
            } else {
                $returnResponse = ['status' => 0, 'message' => "try again"];
                return ($returnResponse);
            }
            break;
        case 'CHK':
            if ($User_re) {
                if ($totalRows_User_re > 0) {
                    $all = [];
                    while ($row_User_re = mysqli_fetch_assoc($User_re)) {
                        $all[] = $row_User_re;
                    };
                    $arr = ['status' => 1, 'message' => $all];
                    return ($arr);
                } else {
                    $returnResponse = ['status' => 0, 'message' => "try again"];
                    return ($returnResponse);
                }
            } else {
                $returnResponse = ['status' => 0, 'message' => "try again"];
                return ($returnResponse);
            }
            break;

        default:
            break;
    }
}

function login($username, $password)
{
    include "config/index.php";
    $query_User_re = sprintf("SELECT * FROM `payer_user` WHERE email='{$username}'");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        if ($row_User_re['password'] == $password) {
            $arr = ['status' => 1, 'message' => 'Buzzing you in 😎', 'user' => $row_User_re];
            exit(json_encode($arr));
        }
    } else {
        $arr = ['status' => 0, 'message' => 'User does not exist',];
        exit(json_encode($arr));
    }
}


function loginAdmin($username, $password)
{
    include "config/index.php";
    $query_User_re = sprintf("SELECT * FROM `Administrative_users` WHERE email='{$username}'");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        if ($row_User_re['password'] == $password) {
            $arr = ['status' => 1, 'message' => 'Buzzing you in 😎', 'user' => $row_User_re];
            exit(json_encode($arr));
        }
    } else {
        $arr = ['status' => 0, 'message' => 'User does not exist',];
        exit(json_encode($arr));
    }
}

function loginMda($username, $password)
{
    include "config/index.php";
    $query_User_re = sprintf("SELECT * FROM `mda_users` WHERE email='{$username}'");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        if ($row_User_re['password'] == $password) {
            $arr = ['status' => 1, 'message' => 'Buzzing you in 😎', 'user' => $row_User_re];
            exit(json_encode($arr));
        }
    } else {
        $arr = ['status' => 0, 'message' => 'User does not exist',];
        exit(json_encode($arr));
    }
}

function createUser($data)
{
    include "config/index.php";
    include "config/enctp.php";
    $email = $data->email;
    $password = $data->password;
    $fullname = $data->fullname;
    $phone = $data->phone;
    $dashboard_access = $data->dashboard_access;
    $analytics_access = $data->analytics_access;
    $mda_access = $data->mda_access;
    $reports_access = $data->reports_access;
    $tax_payer_access = $data->tax_payer_access;
    $users_access = $data->users_access;
    $cms_access = $data->cms_access;
    $img = $data->img;
    $support = $data->support;
    $verification = encripted_data($email . "£" . "2880" . "_");
    $query_User_re = sprintf("INSERT INTO `Administrative_users`(`fullname`, `email`, `phone`, `password`, `dashboard_access`, `analytics_access`, `mda_access`, `reports_access`, `tax_payer_access`, `users_access`, `cms_access`, `support`, `img`, `verification_status`) 
                VALUES ('$fullname', '$email', '$phone', '$password','$dashboard_access','$analytics_access','$mda_access','$reports_access','$tax_payer_access','$users_access','$cms_access','$support','$img','$verification')");
    $check_exist = check_db_query_staus("SELECT email FROM Administrative_users WHERE email='{$email}'", "CHK");

    if ($check_exist['status'] == 1) {
        $returnResponse = ['status' => 2, 'message' => "{$email} exists already"];
        exit(json_encode($returnResponse));
    } else {
        $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $last_id = mysqli_insert_id($ibsConnection);
            $mail = new PHPMailer(true);


            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'steamledge.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'primeguage@steamledge.com';                     //SMTP username
            $mail->Password   = 'primeguage@2023';                               //SMTP password
            $mail->SMTPSecure = 'ssl';          //Enable implicit TLS encryption
            $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('primeguage@steamledge.com', 'Primeguage');
            $mail->addAddress($email);     //Add a recipient
            // $mail->addAddress('ellen@example.com');               //Name is optional
            // $mail->addReplyTo('info@example.com', 'Information');


            //Content
            $bodyB = "Hi $fullname! Click on the link to verify your Account https://steamledge.com/primeguage/createpassword.html?id=$last_id&verification=$verification";
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = "Account Verification";
            $mail->Body    = ($bodyB);
            $mail->send();
            $returnResponse = ['status' => 1, 'message' => "{$email} added successfully", "id" => $last_id];
            exit(json_encode($returnResponse));
        } else {
            $returnResponse = ['status' => 0, 'message' => "{$email} not created, try again"];
            exit(json_encode($returnResponse));
        }
    }
}

function createMDA($data)
{
    include "config/index.php";
    include "config/enctp.php";
    $email = $data->email;
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array();
    $alphaLength = strlen($alphabet) - 1;
    for ($i = 0; $i < 10; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    $password = implode($pass);
    $fullname = $data->fullname;
    $phone = $data->phone;
    $industry = $data->industry;
    $state = $data->state;
    $geolocation = $data->geolocation;
    $lga = $data->lga;
    $address = $data->address;
    $status = $data->status;
    $query_User_re = sprintf("INSERT INTO `mda`(`fullname`, `email`, `password`, `phone`, `industry`, `state`, `geolocation`, `lga`, `address`, `status`)
                VALUES ('$fullname', '$email', '$password', '$phone', '$industry','$state','$geolocation','$lga','$address','$status')");
    $check_exist = check_db_query_staus("SELECT email FROM mda WHERE email='{$email}'", "CHK");

    if ($check_exist['status'] == 1) {
        $returnResponse = ['status' => 2, 'message' => "{$email} exists already"];
        exit(json_encode($returnResponse));
    } else {
        $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $returnResponse = ['status' => 1, 'message' => "{$email} added successfully", 'pass' => $password];
            exit(json_encode($returnResponse));
        } else {
            $returnResponse = ['status' => 0, 'message' => "{$email} not created, try again"];
            exit(json_encode($returnResponse));
        }
    }
}

function createMDAPaymentForm($data)
{
    include "config/index.php";
    include "config/enctp.php";
    $content = $data->content;
    $mda_id = $data->mda_id;
    $table_name = "payment" . "_" . $mda_id;
    $query_User_re = sprintf("INSERT INTO `payment_form_labels`(`table_name`, `content`, `mda_id`)
                VALUES ('$table_name', '$content', '$mda_id')");
    $check_exist = check_db_query_staus("SELECT mda_id FROM payment_form_labels WHERE mda_id={$mda_id}", "CHK");

    if ($check_exist['status'] == 1) {
        $returnResponse = ['status' => 2, 'message' => "MDA Payment form exists already"];
        exit(json_encode($returnResponse));
    } else {
        $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $returnResponse = ['status' => 1, 'message' => "Payment form added successfully"];
            $context_type = ["number" => "int", "text" => "varchar"];
            $context_length = ["number" => "255", "text" => "100"];
            $content =  explode(",", $content);
            // $content_1 = [];
            $txt = "";
            foreach ($content as $key => $value) {
                $content_1 = explode("^", $value);
                // foreach ($content_1 as $key1 => $value1) {

                // }
                $txt .= "`{$key}` {$context_type[$content_1[1]]}({$context_length[$content_1[1]]}) NULL,";
                // echo $txt."\n";
            }
            // $txt = rtrim($txt, ",");
            $query_User_re_table = sprintf("CREATE TABLE `{$table_name}` (id INT AUTO_INCREMENT primary key NOT NULL, {$txt} `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp())");
            $User_re_table = mysqli_query($ibsConnection, $query_User_re_table) or die(mysqli_error($ibsConnection));


            exit(json_encode($returnResponse));
        } else {
            $returnResponse = ['status' => 0, 'message' => "Payment form not created, try again"];
            exit(json_encode($returnResponse));
        }
    }
}

function getMDAs()
{
    include "config/index.php";
    include "config/enctp.php";
    $query_User_re = sprintf("SELECT `id`, `fullname`, `email`, `phone`, `industry`, `state`, `geolocation`, `lga`, `address`, `status` FROM `mda`");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);

    if ($totalRows_User_re > 0) {
        $products_array = [];
        while ($row_User_re = mysqli_fetch_assoc($User_re)) {
            $data = $row_User_re['fullname'];
            $sql_details = "SELECT COUNT(*) FROM `revenue_heads` WHERE `COL_3`= '{$data}' ";
            $result_details = mysqli_query($ibsConnection, $sql_details) or die(mysqli_error($ibsConnection));
            if (mysqli_num_rows($result_details) > 0) {
                $all = [];
                while ($row_details = mysqli_fetch_assoc($result_details)) {

                    $all = array_merge($row_User_re, $row_details);
                    array_push($products_array, $all);
                }
            } else {
            }
            $returnResponse = ['status' => 1, 'message' => $products_array];
        }
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "try again"];
        exit(json_encode($returnResponse));
    }
}
function getRevenueHead()
{
    $pull_data = check_db_query_staus1("SELECT * FROM revenue_heads", "CHK");
    exit(json_encode($pull_data));
}
function getMDAsRevenueHead($data)
{
    $pull_data = check_db_query_staus1("SELECT `id`, `COL_1`, `COL_2`, `COL_3`, `COL_4`, `COL_5`, `COL_6`, COUNT(*) FROM `revenue_heads` WHERE `COL_3`= '{$data}' ", "CHK");
    exit(json_encode($pull_data));
}

function getMDAsRevenueHeadId($data)
{
    $pull_data = check_db_query_staus1("SELECT `id`, `COL_1`, `COL_2`, `COL_3`, `COL_4`, `COL_5`, `COL_6` FROM `revenue_heads` WHERE `id`= '{$data}' ", "CHK");
    exit(json_encode($pull_data));
}

function getIndustries()
{
    $pull_data = check_db_query_staus1("SELECT DISTINCT `COL_3` FROM `revenue_heads`", "CHK");
    exit(json_encode($pull_data));
}

function getTaxPayerList()
{
    $pull_data = check_db_query_staus1("SELECT * FROM `payer_user`", "CHK");
    exit(json_encode($pull_data));
}
function getSingleTaxPayerList($data)
{
    $pull_data = check_db_query_staus1("SELECT * FROM `payer_user` WHERE `id`= '{$data}' ", "CHK");
    exit(json_encode($pull_data));
}

function createMDARevenueHeads($data)
{
    include "config/index.php";
    include "config/enctp.php";
    $mda_id = $data->mda_id;
    $fullname = $data->fullname;
    $adminCode = $data->adminCode;
    $amount = $data->amount;
    $economicCode = $data->economicCode;
    $category = $data->category;
    $query_User_re = sprintf("INSERT INTO `revenue_heads`(`COL_1`, `COL_2`, `COL_3`, `COL_4`, `COL_5`, `COL_6`)
                VALUES ('$adminCode', '$economicCode', '$mda_id', '$fullname', '$category', '$amount')");
    $check_exist = check_db_query_staus("SELECT `COL_4` FROM revenue_heads WHERE `COL_4`='{$fullname}'", "CHK");

    if ($check_exist['status'] == 1) {
        $returnResponse = ['status' => 2, 'message' => "{$fullname} exists already"];
        exit(json_encode($returnResponse));
    } else {
        $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $returnResponse = ['status' => 1, 'message' => "{$fullname} added successfully"];
            exit(json_encode($returnResponse));
        } else {
            $returnResponse = ['status' => 0, 'message' => "{$fullname} not created, try again"];
            exit(json_encode($returnResponse));
        }
    }
}

function paymentToMDARevenueHeads($data)
{
    include "config/index.php";
    include "config/enctp.php";

    $invoice_number = $data->invoice_number;
    $payment_channel = $data->payment_channel;
    $payment_reference_number = $data->payment_reference_number;
    $receipt_number = $data->receipt_number;
    $other_details = check_db_query_staus("SELECT * FROM invoices WHERE invoice_number='{$invoice_number}'", "CHK");
    if ($other_details['status'] == 1) {
        // print_r($other_details1);
        $revenue_head = $other_details['message']['revenue_head'];
        $user_id = $other_details['message']['payer_id'];
        $other_details1 = check_db_query_staus("SELECT COL_3 FROM revenue_heads WHERE id='{$revenue_head}'", "CHK");
        $mda_id = $other_details1['message']['COL_3'];
        $query_User_re = sprintf("INSERT INTO `payment_collection_report_individual`(`mda_id`, `revenue_head`, `user_id`, `invoice_number`, `payment_channel`, `payment_reference_number`, `receipt_number`)
                    VALUES ('$mda_id', '$revenue_head', '$user_id', '$invoice_number', '$payment_channel', '$payment_reference_number', '$receipt_number')");
        $check_exist = check_db_query_staus("SELECT payment_reference_number FROM payment_collection_report_individual WHERE payment_reference_number='{$payment_reference_number}'", "CHK");
        if ($check_exist['status'] == 1) {
            $returnResponse = ['status' => 2, 'message' => "{$payment_reference_number} exists already"];
            exit(json_encode($returnResponse));
        } else {
            $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
            if ($User_re) {
                $returnResponse = ['status' => 1, 'message' => "{$invoice_number} added successfully"];
                exit(json_encode($returnResponse));
            } else {
                $returnResponse = ['status' => 0, 'message' => "{$invoice_number} not created, try again"];
                exit(json_encode($returnResponse));
            }
        }
    }
}


function generatePayerID()
{
    $chars = "0123456789";
    $payerID = substr(str_shuffle($chars), 0, 5);
    return $payerID;
}

function createPayerUser($data)

{
    include "config/index.php";
    include "config/enctp.php";
    $email = $data->email;
    $password = $data->password;
    $first_name = $data->first_name;
    $surname = $data->surname;
    $category = $data->category;
    $category1 = explode(" ", $category);
    $tax_number = "AKW" . $category1[0] . "-" . generatePayerID();
    $phone = $data->phone;
    $state = $data->state;
    $employment_status = $data->employment_status;
    $business_type = $data->business_type;
    $lga = $data->lga;
    $img = $data->img;
    $address = $data->address;
    $tin = $data->tin;
    $numberofstaff = $data->numberofstaff;
    $verification = encripted_data($email . "£" . "2880" . "_");
    $verification_code = substr(str_shuffle(str_repeat("0123456789", 6)), 0, 6);
    $query_User_re = sprintf("INSERT INTO `payer_user`(`tax_number`, `category`, `first_name`, `surname`, `email`, `phone`, `state`,`business_type`,`employment_status`,`lga`, `address`,`img`,`password`,`verification_status`,`verification_code`,`tin`,`number_of_staff`) 
                VALUES ('$tax_number', '$category', '$first_name', '$surname','$email','$phone','$state','$business_type','$employment_status','$lga','$address','$img','$password','$verification','$verification_code','$tin','$numberofstaff')");
    $check_exist = check_db_query_staus("SELECT email, tax_number, tax_number FROM payer_user WHERE email='{$email}'", "CHK");

    if ($check_exist['status'] == 1) {
        $returnResponse = ['status' => 2, 'message' => "{$email} exists already", "data" => $check_exist, "data" => $check_exist];
        exit(json_encode($returnResponse));
    } else {
        $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $last_id = mysqli_insert_id($ibsConnection);
            $fetched_data_last_id = check_db_query_staus("SELECT tax_number FROM payer_user WHERE id = $last_id", "CHK");
            $returnResponse = ['status' => 1, 'message' => "{$email} added successfully", "data" => $fetched_data_last_id['message'], "id" => $last_id];
            exit(json_encode($returnResponse));
        } else {
            $returnResponse = ['status' => 0, 'message' => "{$email} not created, try again"];
            exit(json_encode($returnResponse));
        }
    }
}

function userProfile($id)
{
    include "config/index.php";
    $query_User_re = sprintf("SELECT * FROM `payer_user` WHERE id='{$id}'");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
            $arr = ['status' => 1, 'message' => 'Buzzing you in 😎', 'user' => $row_User_re];
            exit(json_encode($arr));
    } else {
        $arr = ['status' => 0, 'message' => 'User does not exist',];
        exit(json_encode($arr));
    }
}

function updateMDA($data)
{
    // print_r($data);
    $value_to_update = "";
    $md_id = "";
    foreach ($data as $key => $value) {
        if ($key == "mda_id") {
            $md_id = $value;
        }
        if (($key != "updateMDA") && ($key != "mda_id")) {
            $value_to_update .= "`{$key}`='{$value}',";
        }
    }
    $value_to_update = rtrim($value_to_update, ",");
    exit(json_encode(check_db_query_staus("UPDATE `mda` SET {$value_to_update} WHERE `id`='{$md_id}'", "UPD")));
}

function deleteMDA($md_id)
{
    // print_r($data);
    exit(json_encode(check_db_query_staus("DELETE FROM `mda` WHERE `id`='{$md_id}'", "DEL")));
}

function deleteRevenueHead($id)
{
    // print_r($data);
    exit(json_encode(check_db_query_staus("DELETE FROM `revenue_heads` WHERE `id`='{$id}'", "DEL")));
}

function updateRevenueHead($data)
{
    // print_r($data);
    $value_to_update = "";
    $id = "";
    foreach ($data as $key => $value) {
        if ($key == "id") {
            $id = $value;
        }
        if (($key != "updateRevenueHead") && ($key != "id")) {
            $value_to_update .= "`{$key}`='{$value}',";
        }
    }
    $value_to_update = rtrim($value_to_update, ",");
    exit(json_encode(check_db_query_staus("UPDATE `revenue_heads` SET {$value_to_update} WHERE `id`='{$id}'", "UPD")));
}

function updateTaxPayer($data)
{
    // print_r($data);
    $value_to_update = "";
    $id = "";
    foreach ($data as $key => $value) {
        if ($key == "id") {
            $id = $value;
        }
        if (($key != "updateTaxPayer") && ($key != "id")) {
            $value_to_update .= "`{$key}`='{$value}',";
        }
    }
    $value_to_update = rtrim($value_to_update, ",");
    exit(json_encode(check_db_query_staus("UPDATE `payer_user` SET {$value_to_update} WHERE `id`='{$id}'", "UPD")));
}

function generateSequenceNumber()
{
    // Connect to database and retrieve the last used ID
    include "config/index.php";
    $result = mysqli_query($ibsConnection, "SELECT MAX(id) FROM invoices");
    $row = mysqli_fetch_row($result);
    $lastID = $row[0];

    // Increment the last used ID to get the next ID
    $nextID = $lastID + 1;

    // Pad the next ID with leading zeros to make it 10 characters long
    $sequenceNumber = str_pad($nextID, 10, "0", STR_PAD_LEFT);

    return $sequenceNumber;
}

function generateInvoice($data)
{
    include "config/index.php";
    // Retrieve the relevant information from the "payer" table
    $tax_number = $data;
    $sql = "SELECT id, category, first_name, surname, email, phone, state, lga, address FROM payer_user WHERE tax_number = '$tax_number'";
    $result = mysqli_query($ibsConnection, $sql);
    $resp = [];
    // Iterate over the results
    while ($row = mysqli_fetch_assoc($result)) {
        $payer_id = $row["id"];
        $category = $row["category"];
        $first_name = $row["first_name"];
        $surname = $row["surname"];
        $email = $row["email"];
        $phone = $row["phone"];
        $state = $row["state"];
        $lga = $row["lga"];
        $address = $row["address"];

        //Retrieve the relevant information from the "what to pay for" table
        $sql1 = "SELECT id, COL_4, COL_2, COL_3, COL_5, COL_6 FROM revenue_heads WHERE COL_5 = '$category'";
        $result1 = mysqli_query($ibsConnection, $sql1);
        while ($row1 = mysqli_fetch_assoc($result1)) {
            $revenue_head_id = $row1["id"];
            $economic_code = $row1["COL_2"];
            $mda = $row1["COL_3"];
            $category1 = $row1["COL_5"];
            $price = $row1["COL_6"];
            $invoice_number = generateSequenceNumber();
            // Set the due date as a future date
            $due_date = date("Y-m-d", strtotime("+1 month"));
            // Insert the new invoice into the "invoice" table
            $sql2 = "INSERT INTO invoices (invoice_number, payer_id, revenue_head, due_date, payment_status) 
                    VALUES ('$invoice_number', $payer_id, $revenue_head_id,'$due_date', 2)";
            if (mysqli_query($ibsConnection, $sql2)) {
                $resp[] = "Invoice generated successfully";
            }
        }
        // Generate a unique invoice number
    }
    exit(json_encode($resp));
}

function generateSignleInvoice($data)
{
    include "config/index.php";
    // Retrieve the relevant information from the "payer" table
    $tax_number = $data['tax_number'];
    $revenue_head_id1 = $data['revenue_head_id'];
    $sql = "SELECT id, category, first_name, surname, email, phone, state, lga, address FROM payer_user WHERE tax_number = '$tax_number'";
    $result = mysqli_query($ibsConnection, $sql);
    $resp = [];
    // Iterate over the results
    while ($row = mysqli_fetch_assoc($result)) {
        $payer_id = $row["id"];
        $category = $row["category"];
        $first_name = $row["first_name"];
        $surname = $row["surname"];
        $email = $row["email"];
        $phone = $row["phone"];
        $state = $row["state"];
        $lga = $row["lga"];
        $address = $row["address"];

        //Retrieve the relevant information from the "what to pay for" table
        $sql1 = "SELECT id, COL_4, COL_2, COL_3, COL_5, COL_6 FROM revenue_heads WHERE id in ({$revenue_head_id1})";
        $result1 = mysqli_query($ibsConnection, $sql1);
        $invoice_number = generateSequenceNumber();
        while ($row1 = mysqli_fetch_assoc($result1)) {
            $revenue_head_id = $row1["id"];
            $economic_code = $row1["COL_2"];
            $mda = $row1["COL_3"];
            $category1 = $row1["COL_5"];
            $price = $row1["COL_6"];
            // Set the due date as a future date
            $due_date = date("Y-m-d", strtotime("+1 month"));
            // Insert the new invoice into the "invoice" table
            $sql2 = "INSERT INTO invoices (invoice_number, payer_id, revenue_head, due_date, payment_status) 
                    VALUES ('$invoice_number', $payer_id, $revenue_head_id,'$due_date', 2)";
            if (mysqli_query($ibsConnection, $sql2)) {
                $resp = ["status" => 1, "message" => "Invoice generated successfully", "invoice_number" => $invoice_number];
            } else {
                $resp = ["status" => 1, "message" => "Error generating Invoice"];
            }
        }
        // Generate a unique invoice number
    }
    exit(json_encode($resp));
}



function fetchAllPayment()
{
    // print_r($data);
    exit(json_encode(check_db_query_staus1("SELECT * FROM payment_collection_report_individual INNER JOIN revenue_heads on payment_collection_report_individual.revenue_head=revenue_heads.id INNER JOIN payer_user on payment_collection_report_individual.user_id=payer_user.id", "CHK")));
}

function fetchPayment($data)
{
    // print_r($data);
    $value_to_update = "";

    foreach ($data as $key => $value) {

        if (($key != "fetchPayment") && ($key != "id")) {
            $value_to_update .= "`{$key}`='{$value}',";
        }
    }
    $value_to_update = rtrim($value_to_update, ",");
    exit(json_encode(check_db_query_staus1("SELECT * FROM payment_collection_report_individual INNER JOIN revenue_heads on payment_collection_report_individual.revenue_head=revenue_heads.id WHERE {$value_to_update}", "CHK")));
}

function verifyInvoice($data)
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus("SELECT * FROM invoices WHERE invoice_number='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function userInvoices($data)
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT invoices.payer_id, invoices.revenue_head,invoices.invoice_number, invoices.due_date, invoices.payment_status,revenue_heads.COL_3,revenue_heads.COL_4,revenue_heads.COL_6,payer_user.tax_number,payer_user.first_name,payer_user.surname FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.payer_id='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}
function getAllInvoice()
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function userInvoiceSingle($data)
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT invoices.payer_id, invoices.revenue_head,invoices.invoice_number, invoices.due_date, invoices.payment_status, invoices.date_created, revenue_heads.COL_3,revenue_heads.COL_4,revenue_heads.COL_6,payer_user.tax_number,payer_user.first_name,payer_user.surname,payer_user.address FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.invoice_number='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function updateProfile($data)
{
    // print_r($data);
    if (isset($data)) {
        include "config/index.php";
        include "config/enctp.php";
        $id = $data->id;
        $subject = $data->subject;
        $name_of_organization = $data->name_of_organization;
        $username = $data->username;
        $email = $data->email;
        $contact = $data->contact;
        $tax_id_no = $data->tax_id_no;
        $state = $data->state;
        $employment_status = $data->employment_status;
        $business_type = $data->business_type;


        $query = "UPDATE `profileUpdate` SET `subject`='{$data->subject}', `name_of_organization`='{$data->name_of_organization}', `username`='{$data->username}', `email`='{$data->email}', `contact`='{$data->contact}', `tax_id_no`='{$data->tax_id_no}', `state`='{$data->state}', `l_g_a`='{$data->l_g_a}', `employment_status`='{$data->employment_status}', `business_type`='{$data->business_type}' WHERE `id` = {$data->id}";
        $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $success_updating = ["status" => 1, "message" => "User Profile Successfully Updated"];
            exit(json_encode($success_updating));
        } else {
            $error_updating = ["Error" => "Invalid operation"];
            exit(json_encode($error_updating));
        }
    }
}

function sendSMS($destination, $message)
{

    $apiKey = "VDiuQ1nWkOhDVawGqJ3e0JyJjyofkZ1b9nIQyCMg2jq5HHpjpuDQr1EUYSmx"; // Your BulkSMS Nigeria API key

    $url = "https://www.bulksmsnigeria.com/api/v1/sms/create?api_token=" . $apiKey . "&from=AKW-IBS&to=" . $destination . "&body=" . urlencode($message) . "&dnd=6";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);

    $response = curl_exec($ch);
    curl_close($ch);

    $result = json_decode($response);
    echo $response;
    // if ($result->status == "success") {
    //     echo "SMS sent successfully!";
    // } else {
    //     echo "Error sending SMS: " . $result->message;
    // }
}


function dashboardAnalyticsEndUser($data)
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);

    //DUE AMOUNT
    $c_date = date('Y-m-d');
    $check_exist = check_db_query_staus1("SELECT invoices.payer_id, invoices.revenue_head,invoices.invoice_number, invoices.due_date, invoices.payment_status,revenue_heads.COL_3,revenue_heads.COL_4,revenue_heads.COL_6,payer_user.tax_number,payer_user.first_name,payer_user.surname FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.payer_id='{$data}' AND invoices.due_date < '{$c_date}'", "CHK");
    $check_exist1 = check_db_query_staus1("SELECT SUM(revenue_heads.COL_6) as total FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.payer_id='{$data}'", "CHK");
    $check_exist2 = check_db_query_staus1("SELECT SUM(revenue_heads.COL_6) as total FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.payer_id='{$data}' AND invoices.payment_status='paid'", "CHK");

    $due_amount = (int)"";
    $due_invoices = (int)"";
    $total_amount_invoiced = (int)"";
    $total_amount_paid = (int)"";
    if ($check_exist['status'] == 1) {
        // $check_exist['message'];
        $due_invoices = count($check_exist['message']);
        foreach ($check_exist['message'] as $key => $value) {
            $due_amount += (int) $value['COL_6'];
        }
    } else if ($check_exist['status'] == 0) {
        $due_amount = 0;
        $due_invoices = 0;
    }
    if ($check_exist1['status'] == 1) {
        // $check_exist['message'];
        $total_amount_invoiced = (int)$check_exist1['message'][0]['total'];
    } else if ($check_exist['status'] == 0) {
        $total_amount_invoiced = 0;
        // $due_invoices = 0;
    }
    if ($check_exist2['status'] == 1) {
        // $check_exist['message'];
        $total_amount_paid = (int)$check_exist2['message'][0]['total'];
    } else if ($check_exist['status'] == 0) {
        $total_amount_paid = 0;
        // $due_invoices = 0;
    }

    $arr = ["due_amount" => $due_amount, "due_invoices" => $due_invoices, "total_amount_invoiced" => $total_amount_invoiced, "total_amount_paid" => $total_amount_paid];
    exit(json_encode($arr));

    //
}

function UpdateTINStatus($data)
{
    include "config/index.php";
    include "config/enctp.php";

    $id = $_GET['id'];
    $status = $_GET['status'];
    if (!empty($data)) {

        if ($status == 1) {
            $status = 'Verified';
        } else {
            $status = 'Unverified';
        }
        //print_r($status); die;
        $query = "UPDATE `payer_user` SET `tin_status`='{$status}' WHERE `id` = {$id}";
        $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $arr = ["status" => 1, "message" => "Tax payers tin status successfully updated"];
            exit(json_encode($arr));
        } else {
            $error_updating = ["Error" => "Invalid operation"];
            exit(json_encode($error_updating));
        }
    }
}

function updatePassword($data)
{
    include "config/index.php";
    include "config/enctp.php";

    $id = $_GET['id'];
    $password = $_GET['password'];

        $query = "UPDATE `payer_user` SET `password`='{$password}' WHERE `id` = {$id}";
        $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $arr = ["status" => 1, "message" => "Password successfully updated"];
            exit(json_encode($arr));
        } else {
            $error_updating = ["Error" => "Invalid operation"];
            exit(json_encode($error_updating));
        }
    }

function ParticularMDAUsers($data)
{
    //print_r($data);die;

    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM `mda_users` WHERE mda_id='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function createMDAUser($data)
{

    include "config/index.php";
    include "config/enctp.php";
    $mda_id = $data->mda_id;
    $name = $data->name;
    $email = $data->email;
    $phone_number = $data->phone_number;
    $passwd = $data->passwd;
    $dashboard_access = $data->dashboard_access;
    $revenue_head_access = $data->revenue_head_access;
    $payment_access = $data->payment_access;
    $users_access = $data->users_access;
    $report_access = $data->report_access;



    $query_User_re = sprintf("INSERT INTO `mda_users`(`mda_id`, `name`, `email`, `phone_number`, `passwd`, `dashboard_access`, `revenue_head_access`, `payment_access`, `users_access`, `report_access`) VALUES ('$mda_id', '$name', '$email', '$phone_number','$passwd','$dashboard_access','$revenue_head_access','$payment_access','$users_access','$report_access')");
    //print_r($query_User_re); die;
    $check_exist = check_db_query_staus("SELECT email FROM mda_users WHERE email='{$email}'", "CHK");

    if ($check_exist['status'] == 1) {
        $returnResponse = ['status' => 2, 'message' => "MDA User exists already"];
        exit(json_encode($returnResponse));
    } else {
        $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $returnResponse = ['status' => 1, 'message' => "MDA User added successfully"];
            exit(json_encode($returnResponse));
        } else {
            $returnResponse = ['status' => 0, 'message' => "MDA User not created, try again"];
            exit(json_encode($returnResponse));
        }
    }
}


function pendingPaymentList($data)
{
    // print_r($data); die;
    include "config/index.php";
    include "config/enctp.php";
    $date_of_payment = $data->date_of_payment;
    $payer_id = $data->payer_id;
    $user_id = $data->user_id;
    $mda_id = $data->mda_id;
    $revenue_head = $data->revenue_head;
    $payment_amount = $data->payment_amount;
    $other_info = $data->other_info;
    $payment_status = $data->payment_status;
    $status = $data->status;


    $query_User_re = sprintf("INSERT INTO `pending_payment_list`(`date_of_payment`, `payer_id`, `user_id`, `mda_id`, `revenue_id`, `payment_amount`, `other_info`, `payment_status`, `status`) VALUES ('$date_of_payment', '$payer_id', '$user_id', '$mda_id', '$revenue_head', '$payment_amount','$other_info','$payment_status','$status')");
    //print_r($query_User_re); die;

    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Pending Payment added successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "Transaction Failed, try again"];
        exit(json_encode($returnResponse));
    }
}

function updatePendingPayentStatus($data)
{
    // print_r($data);
    include "config/index.php";
    include "config/enctp.php";

    if (!empty($data)) {
        $query = "UPDATE `pending_payment_list` SET `payment_status` = 'invoiced' WHERE `user_id` = {$data}";
        $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $arr = ["status" => 1, "message" => "Pending Payent Status successfully updated to invoiced"];
            exit(json_encode($arr));
        } else {
            $error_updating = ["Error" => "Invalid operation"];
            exit(json_encode($error_updating));
        }
    }
}

function dashboardAnalyticsAdmin()
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);

    //DUE AMOUNT
    $c_date = date('Y-m-d');
    $check_exist = check_db_query_staus1("SELECT invoices.payer_id, invoices.revenue_head,invoices.invoice_number, invoices.due_date, invoices.payment_status,revenue_heads.COL_3,revenue_heads.COL_4,revenue_heads.COL_6,payer_user.tax_number,payer_user.first_name,payer_user.surname FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.due_date < '{$c_date}'", "CHK");
    $check_exist1 = check_db_query_staus1("SELECT SUM(revenue_heads.COL_6) as total FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id", "CHK");
    $check_exist2 = check_db_query_staus1("SELECT SUM(revenue_heads.COL_6) as total FROM invoices JOIN payer_user ON invoices.payer_id = payer_user.id JOIN revenue_heads ON invoices.revenue_head = revenue_heads.id WHERE invoices.payment_status='paid'", "CHK");

    $due_amount = (int)"";
    $due_invoices = (int)"";
    $total_amount_invoiced = (int)"";
    $total_amount_paid = (int)"";
    if ($check_exist['status'] == 1) {
        // $check_exist['message'];
        $due_invoices = count($check_exist['message']);
        foreach ($check_exist['message'] as $key => $value) {
            $due_amount += (int) $value['COL_6'];
        }
    } else if ($check_exist['status'] == 0) {
        $due_amount = 0;
        $due_invoices = 0;
    }
    if ($check_exist1['status'] == 1) {
        // $check_exist['message'];
        $total_amount_invoiced = (int)$check_exist1['message'][0]['total'];
    } else if ($check_exist['status'] == 0) {
        $total_amount_invoiced = 0;
        // $due_invoices = 0;
    }
    if ($check_exist2['status'] == 1) {
        // $check_exist['message'];
        $total_amount_paid = (int)$check_exist2['message'][0]['total'];
    } else if ($check_exist['status'] == 0) {
        $total_amount_paid = 0;
        // $due_invoices = 0;
    }

    $arr = ["due_amount" => $due_amount, "due_invoices" => $due_invoices, "total_amount_invoiced" => $total_amount_invoiced, "total_amount_paid" => $total_amount_paid];
    exit(json_encode($arr));

    //
}

function getAdminUsers()
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT `id`, `fullname`, `email`, `phone`, `dashboard_access`, `analytics_access`, `mda_access`, `reports_access`, `tax_payer_access`, `users_access`, `cms_access`, `support`, `img`, `verification_status` FROM Administrative_users", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function updateAdminUser($data)
{
    // print_r($data);
    $value_to_update = "";
    $id = "";
    foreach ($data as $key => $value) {
        if ($key == "id") {
            $id = $value;
        }
        if (($key != "updateAdminUser") && ($key != "id")) {
            $value_to_update .= "`{$key}`='{$value}',";
        }
    }
    $value_to_update = rtrim($value_to_update, ",");
    exit(json_encode(check_db_query_staus("UPDATE `Administrative_users` SET {$value_to_update} WHERE `id`='{$id}'", "UPD")));
}

function deleteAdminUser($id)
{
    // print_r($data);
    exit(json_encode(check_db_query_staus("DELETE FROM `Administrative_users` WHERE `id`='{$id}'", "DEL")));
}

function getMDACollectionPayments($data)
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT pending_payment_list.payment_amount, pending_payment_list.other_info, pending_payment_list.payment_status, pending_payment_list.date_of_payment, mda_users.name, revenue_heads.COL_4 as revenue_name, revenue_heads.COL_6 as actual_amount FROM pending_payment_list JOIN mda_users ON pending_payment_list.user_id = mda_users.id JOIN revenue_heads ON pending_payment_list.revenue_id = revenue_heads.id WHERE pending_payment_list.mda_id='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}
function updateMDAUser($data)
{
    // print_r($data);
    $value_to_update = "";
    $id = "";
    foreach ($data as $key => $value) {
        if ($key == "id") {
            $id = $value;
        }
        if (($key != "updateMDAUser") && ($key != "id")) {
            $value_to_update .= "`{$key}`='{$value}',";
        }
    }
    $value_to_update = rtrim($value_to_update, ",");
    exit(json_encode(check_db_query_staus("UPDATE `mda_users` SET {$value_to_update} WHERE `id`='{$id}'", "UPD")));
}

function deleteMDAUser($id)
{
    // print_r($data);
    exit(json_encode(check_db_query_staus("DELETE FROM `mda_users` WHERE `id`='{$id}'", "DEL")));
}

function verifyEmail($id)
{


    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $query_User_re = sprintf("SELECT * FROM `payer_user` WHERE `id` = {$id}");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        $email = $row_User_re['email'];
        $name = $row_User_re['first_name'];
        $verification = $row_User_re['verification_status'];
        $id = $row_User_re['id'];

        $mail = new PHPMailer(true);

        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'steamledge.com';                     //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'prime@steamledge.com';                     //SMTP username
        $mail->Password   = 'prime@2023';                               //SMTP password
        $mail->SMTPSecure = 'ssl';          //Enable implicit TLS encryption
        $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

        //Recipients
        $mail->setFrom('prime@steamledge.com', 'Primeguage');
        $mail->addAddress($email);     //Add a recipient
        // $mail->addAddress('ellen@example.com');               //Name is optional
        // $mail->addReplyTo('info@example.com', 'Information');


        //Content
        $bodyB = "Hi $name! Click on the link to verify your Account https://steamledge.com/primeguage/emailverification.html?id=$id&verification=$verification";
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = "Account Verification";
        $mail->Body    = ($bodyB);
        $mail->send();
        $arr = ['status' => 1, 'message' => 'Message sent Successfully 😎'];
        exit(json_encode($arr));
    } else {
        $arr = ['status' => 0, 'message' => 'Message Not sent',];
        exit(json_encode($arr));
    }
}

function UpdateAccountStatus($data)
{
    include "config/index.php";
    include "config/enctp.php";

    $id = $_GET['id'];
    $status = 1;
    $verification = $_GET['verification'];
    $query = "UPDATE `payer_user` SET `verification_status`='{$status}' WHERE `id` = {$id} AND `verification_status`='{$verification}'";
    $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
    if ($User_re) {
        $arr = ["status" => 1, "message" => "Account Activated successfully"];
        exit(json_encode($arr));
    } else {
        $error_updating = ["Error" => "Failed to Activate Account"];
        exit(json_encode($error_updating));
    }
}

function verifySms($data)
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $id = $_GET['id'];
    $numbere = $_GET["num"];
    $query_User_re = sprintf("SELECT * FROM payer_user WHERE `id` = {$id}");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        $message = $row_User_re['verification_code'];
        $destination = $row_User_re['phone'];
        $apiKey = "VDiuQ1nWkOhDVawGqJ3e0JyJjyofkZ1b9nIQyCMg2jq5HHpjpuDQr1EUYSmx"; // Your BulkSMS Nigeria API key

        $url = "https://www.bulksmsnigeria.com/api/v1/sms/create?api_token=" . $apiKey . "&from=AKW-IBS&to=" . $destination . "&body=" . urlencode($message) . "&dnd=" . $numbere;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);

        $response = curl_exec($ch);
        curl_close($ch);

        $arr = ['status' => 1, 'message' => 'Message sent Successfully 😎', "response" => $response];
        exit(json_encode($arr));
    } else {
        $arr = ['status' => 0, 'message' => 'Message Not sent',];
        exit(json_encode($arr));
    }
}

function UpdateAccountStatusSms($data)
{
    include "config/index.php";
    include "config/enctp.php";

    $id = $_GET['id'];
    $status = 1;
    $verification = $_GET['code'];
    $query_User_re = sprintf("SELECT verification_code FROM payer_user WHERE `verification_code`='{$verification}'");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        $query = "UPDATE `payer_user` SET `verification_code`='{$status}' WHERE `verification_code`='{$verification}'";
        $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $arr = ["status" => 1, "message" => "Account Activated successfully"];
            exit(json_encode($arr));
        } else {
            $error_updating = ["Error" => "Failed to Activate Account"];
            exit(json_encode($error_updating));
        }
    } else {
        $arr = ['status' => 0, 'message' => 'Invalid code',];
        exit(json_encode($arr));
    }
}

function getMDAsCount()
{
    $pull_data = check_db_query_staus1("SELECT COUNT(*) FROM mda", "CHK");
    exit(json_encode($pull_data));
}
function getRevenueCount()
{
    $pull_data = check_db_query_staus1("SELECT COUNT(*) FROM revenue_heads", "CHK");
    exit(json_encode($pull_data));
}

function updateProfillePix($data)
{
    $id = $data->id;
    $img = $data->img;
    exit(json_encode(check_db_query_staus("UPDATE `payer_user` SET `img`='{$img}' WHERE `id`='{$id}'", "UPD")));
}

function verifyAdminUser($data)
{
    include "config/index.php";
    include "config/enctp.php";

    $id = $_GET['id'];
    $status = 1;
    $verification = $_GET['code'];
    $passwd = $_GET['password'];
    $query_User_re = sprintf("SELECT verification_status FROM Administrative_users WHERE `verification_status`='{$verification}' AND `id`='{$id}'");
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));
    $row_User_re = mysqli_fetch_assoc($User_re);
    $totalRows_User_re = mysqli_num_rows($User_re);
    if ($totalRows_User_re > 0) {
        $query = "UPDATE `Administrative_users` SET `verification_status`='{$status}', `password`= '{$passwd}' WHERE `verification_status`='{$verification}'";
        $User_re = mysqli_query($ibsConnection, $query) or die(mysqli_error($ibsConnection));
        if ($User_re) {
            $arr = ["status" => 1, "message" => "Account Activated successfully"];
            exit(json_encode($arr));
        } else {
            $error_updating = ["Error" => "Failed to Activate Account"];
            exit(json_encode($error_updating));
        }
    } else {
        $arr = ['status' => 0, 'message' => 'Invalid code',];
        exit(json_encode($arr));
    }
}

function sendContactEmail($data)
{
    $name = $data['name'];
    $email = $data['email'];
    $subject = $data['subject'];
    $message = $data['message'];

    $mail = new PHPMailer(true);


    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'steamledge.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'primeguage@steamledge.com';                     //SMTP username
    $mail->Password   = 'primeguage@2023';                               //SMTP password
    $mail->SMTPSecure = 'ssl';          //Enable implicit TLS encryption
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('primeguage@steamledge.com', $email);
    $mail->addAddress('primeguage@steamledge.com');     //Add a recipient
    // $mail->addAddress('ellen@example.com');               //Name is optional
    // $mail->addReplyTo('info@example.com', 'Information');


    //Content
    $bodyB = $message;
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = $subject;
    $mail->Body    = ($bodyB);

    if ($mail->send()) {
        $arr = ['status' => 1, 'message' => 'Message sent Successfully 😎'];
        exit(json_encode($arr));
    } else {
        $arr = ['status' => 0, 'message' => 'Message not Sent'];
        exit(json_encode($arr));
    }
}

function createMultipleMDAs($data)
{
    include "config/index.php";
    include "config/enctp.php";


    $sql = sprintf("INSERT INTO `mda` (`fullname`, `industry`, `state`, `geolocation`, `lga`, `email`, `phone`, `status`, `password`, `address`) VALUES ");
    foreach ($data as $g) {
        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
        $pass = array();
        $alphaLength = strlen($alphabet) - 1;
        for ($i = 0; $i < 10; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        $password = implode($pass);
        if ($sql != '');
        $sql .= "('" . $g->fullname . "', '" . $g->industry . "', '" . $g->state . "', '" . $g->geolocation . "', '" . $g->lga . "', '" . $g->email . "', '" . $g->phone . "', '" . $g->status . "', '" . $password . "', '" . $g->address . "')";
        $sql .= ',';
    }
    $sql = rtrim($sql, ",");
    $User_re = mysqli_query($ibsConnection, $sql) or die(mysqli_error($ibsConnection));
    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "MDA created successfully", 'pass' => $password];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "MDA not created, try again"];
        exit(json_encode($returnResponse));
    }
}


function createMultpleMDARevenueHeads($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $sql = sprintf("INSERT INTO `revenue_heads`(`COL_1`, `COL_2`, `COL_3`, `COL_4`, `COL_5`, `COL_6`) VALUES ");
    foreach ($data as $g) {
        $economicCode = "045RF";
        $adminCode = "22";
        if ($sql != '');
        $sql .= "('" . $adminCode . "', '" . $economicCode . "', '" . $g->mda_id . "', '" . $g->fullname . "', '" . $g->category . "', '" . $g->amount . "')";
        $sql .= ',';
    }
    $sql = rtrim($sql, ",");
    // print_r($sql);

    $User_re = mysqli_query($ibsConnection, $sql) or die(mysqli_error($ibsConnection));
    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "revenue heads added successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "revenue heads not created, try again"];
        exit(json_encode($returnResponse));
    }
}
function createBanners($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $image = $data->image;
    $body = $data->body;
    $description = $data->description;
    $description_2 = $data->description_2;

    $query_User_re = sprintf("INSERT INTO `banner`(`image`, `body`, `description`, `description_2`) VALUES('$image', '$body', '$description', '$description_2')");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Banner Created successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}

function updateBanners($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $id = $data->id;
    $image = $data->image;
    $body = $data->body;
    $description = $data->description;
    $description_2 = $data->description_2;

    $query_User_re = sprintf("UPDATE `banner` SET `image`='$image',`body`='$body',`description`='$description',`description_2`='$description_2'  WHERE `id`='{$id}'");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Banner Updated successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}

function getBanners()
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM banner", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function deleteBanner($data)
{
    // print_r($data); die;
    exit(json_encode(check_db_query_staus("DELETE FROM `banner` WHERE `id`='{$data}'", "DEL")));
}

function insertContactUs($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $address = $data->address;
    $email = $data->email;
    $phone_number = $data->phone_number;

    $query_User_re = sprintf("INSERT INTO `contact_us`(`address`, `email`, `phone_number`) VALUES('$address', '$email', '$phone_number')");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Contact us Send successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}


function getContactUs()
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM contact_us ORDER BY id DESC", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function updateContactUs($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $id = $data->id;
    $address = $data->address;
    $email = $data->email;
    $phone_number = $data->phone_number;


    $query_User_re = sprintf("UPDATE `contact_us` SET `address`='$address',`email`='$email',`phone_number`='$phone_number' WHERE `id`='{$id}'");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Contact Updated successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}


function insertOurServices($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $header = $data->header;
    $body = $data->body;
    $icon = $data->icon;


    $query_User_re = sprintf("INSERT INTO `our_services`(`header`, `body`, `icon`) VALUES ('$header', '$body','$icon')");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Our Services Created successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}
function updateOurServices($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $id = $data->id;
    $header = $data->header;
    $body = $data->body;
    $icon = $data->icon;


    $query_User_re = sprintf("UPDATE `our_services` SET `header`='$header',`body`='$body',`icon`='$icon' WHERE `id`='{$id}'");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Our Services Updated successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}

function getOurServices()
{
    include "config/index.php";
    include "config/enctp.php";
    //print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM our_services ORDER BY id ASC", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function deleteOurServices($data)
{
    // print_r($data); die;
    exit(json_encode(check_db_query_staus("DELETE FROM `our_services` WHERE `id`='{$data}'", "DEL")));
}

function getTaxClearanceCert($data)
{
    include "config/index.php";
    include "config/enctp.php";
    print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM secondary_tax_clearance_certificate  WHERE `primary_tax_clearance_certificate_id`='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function createTaxClearanceCert($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $user_id = $data->user_id;
    $category = $data->category;
    $title = $data->title;
    $first_name = $data->first_name;
    $surname = $data->surname;
    $middle_name = $data->middle_name;
    $date_of_birth = $data->date_of_birth;
    $gender = $data->gender;
    $merital_status = $data->merital_status;
    $tin = $data->tin;
    $bvn = $data->bvn;
    $state = $data->state;
    $local_area = $data->local_area;
    $ward = $data->ward;
    $city = $data->city;
    $street_name = $data->street_name;
    $house_no = $data->house_no;
    $national_id_no = $data->national_id_no;
    $phone = $data->phone;
    $natioality = $data->natioality;
    $tax_station_name = $data->tax_station_name;
    $employment_type = $data->employment_type;
    $occupation = $data->occupation;
    $profession = $data->profession;
    $mother_maiden_name = $data->mother_maiden_name;
    $first_year = $data->first_year;
    $first_income = $data->first_income;
    $second_year = $data->second_year;
    $second_income = $data->second_income;
    $third_year = $data->third_year;
    $third_income = $data->third_income;
    $tax_paid = $data->tax_paid;
    $cop_rep_authorization = $data->cop_rep_authorization;
    $head_tax_station_authorization = $data->head_tax_station_authorization;
    $reference_number =  (time() + rand(1, 1000));
    $application_status = "pending";
    $admin_status = 'active';


    $emai_address = $data->emai_address;
    $state_of_origin = $data->state_of_origin;
    $company_name = $data->company_name;
    $company_branch = $data->company_branch;
    $company_address = $data->company_address;
    $web_address = $data->web_address;
    $official_position = $data->official_position;
    $international_passport_no = $data->international_passport_no;
    $alien_negistration_no = $data->alien_negistration_no;
    $sponsor_name = $data->sponsor_name;
    $sponsor_occupation = $data->sponsor_occupation;
    $sponsor_business = $data->sponsor_business;
    $employment_from_1 = $data->employment_from_1;
    $employment_to_1 = $data->employment_to_1;
    $employment_from_2 = $data->employment_from_2;
    $employment_to_2 = $data->employment_to_2;
    $employment_from_3 = $data->employment_from_3;
    $employment_to_3 = $data->employment_to_3;
    $signature_1 = $data->signature_1;
    $date_1 = $data->date_1;
    $signature_2 = $data->signature_2;
    $date_2 = $data->date_2;

    $query_User_re = sprintf("INSERT INTO `primary_tax_clearance_certificate`(`user_id`, `category`, `title`, `first_name`, `surname`, `middle_name`, `date_of_birth`, `gender`, `merital_status`, `tin`, `bvn`, `state`, `local_area`, `ward`, `city`, `street_name`, `house_no`, `national_id_no`, `phone`, `natioality`, `tax_station_name`, `employment_type`, `occupation`, `profession`, `mother_maiden_name`, `first_year`, `first_income`, `second_year`, `second_income`, `third_year`, `third_income`, `tax_paid`, `cop_rep_authorization`, `head_tax_station_authorization`, `reference_number`, `application_status`, `admin_status`) VALUES ('$user_id', '$category','$title', '$first_name', '$surname', '$middle_name', '$date_of_birth', '$gender', '$merital_status', '$tin', '$bvn', '$state', '$local_area', '$ward', '$city', '$street_name', '$house_no', '$national_id_no', '$phone', '$natioality', '$tax_station_name', '$employment_type', '$occupation', '$profession', '$mother_maiden_name', '$first_year', '$first_income', '$second_year', '$second_income', '$third_year', '$third_income', '$tax_paid', '$cop_rep_authorization', '$head_tax_station_authorization', '$reference_number', '$application_status', '$admin_status')");
    // print_r($query_User_re); die;

    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $primary_tax_clearance_certificate_id = $ibsConnection->insert_id;


        $query_User_re2 = sprintf("INSERT INTO `secondary_tax_clearance_certificate`(`primary_tax_clearance_certificate_id`, `emai_address`, `state_of_origin`, `company_name`, `company_branch`, `company_address`, `web_address`, `official_position`, `international_passport_no`, `alien_negistration_no`, `sponsor_name`, `sponsor_occupation`, `sponsor_business`, `employment_from_1`, `employment_to_1`, `employment_from_2`, `employment_to_2`, `employment_from_3`, `employment_to_3`, `signature_1`, `date_1`, `signature_2`, `date_2`) VALUES ('$primary_tax_clearance_certificate_id', '$emai_address', '$state_of_origin', '$company_name', '$company_branch', '$company_address', '$web_address', '$official_position', '$international_passport_no', '$alien_negistration_no', '$sponsor_name', '$sponsor_occupation', '$sponsor_business', '$employment_from_1', '$employment_to_1', '$employment_from_2', '$employment_to_2', '$employment_from_3', '$employment_to_3', '$signature_1', '$date_1', '$signature_2', '$date_2')");
        // print_r($query_User_re2); die;

        $User_re2 = mysqli_query($ibsConnection, $query_User_re2) or die(mysqli_error($ibsConnection));

        if ($User_re2) {
            $check_exist = check_db_query_staus("SELECT reference_number FROM primary_tax_clearance_certificate  WHERE `user_id`='{$user_id}'", "CHK");

            $arr = [];
          

            $arr[] = ['status' => 1, 'message' => "Tax Clearance Certificate Created successfully"];

              $arr[] = $check_exist['message'];

            exit(json_encode($arr));
        }else {
            $returnResponse = ['status' => 0, 'message' => "Secondary Tax Clearance Certificate failed, try again"];
            exit(json_encode($returnResponse));
        }
    } else {
        $returnResponse = ['status' => 0, 'message' => "Primary Tax Clearance Certificate failed, try again"];
        exit(json_encode($returnResponse));
    }


}
function getTINRequest($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM primary_TIN_request  WHERE `user_id`='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }
}

function createTINRequest($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $user_id = $data->user_id;
    $title = $data->title;
    $first_name = $data->first_name;
    $surname = $data->surname;
    $middle_name = $data->middle_name;
    $natioality = $data->natioality;
    $phone_number_1 = $data->phone_number_1;
    $phone_number_2 = $data->phone_number_2;
    $state_of_origin = $data->state_of_origin;
    $marital_status = $data->marital_status;
    $birthday = $data->birthday;
    $occupation = $data->occupation;
    $gender = $data->gender;
    $email = $data->email;
    $mother_maiden_name = $data->mother_maiden_name;
    $mother_name = $data->mother_name;
    $id_card = $data->id_card;
    $id_number = $data->id_number;
    $date_issue = $data->date_issue;
    $expiring_date = $data->expiring_date;
    $place_of_issue = $data->place_of_issue;
    $id_issuing_authority = $data->id_issuing_authority;
    $last_assessment_date = $data->last_assessment_date;
    $last_assessment_amount = $data->last_assessment_amount;
    $last_payment_date = $data->last_payment_date;
    $last_payment_amount = $data->last_payment_amount;
    $tax_type = $data->tax_type;
    $first_year = $data->first_year;
    $first_income = $data->first_income;
    $second_year = $data->second_year;
    $second_income = $data->second_income;
    $third_year = $data->third_year;
    $third_income = $data->third_income;
    $reference_number =  (time() + rand(1, 1000));
    $application_status = "pending";
    $admin_status = 'active';
    
    
    $name = $data->name;
    $tin = $data->tin;
    $retyp = $data->retyp;
    $reason = $data->reason;
    $state = $data->state;
    $local_gvt = $data->local_gvt;
    $ward = $data->ward;
    $city = $data->city;
    $street_name = $data->street_name;
    $house_no = $data->house_no;
    $source_of_income = $data->source_of_income;
    $employer_name = $data->employer_name;
    $employer_tin = $data->employer_tin;
    $start_date_of_employment = $data->start_date_of_employment;
    $dep_child_first_name = $data->dep_child_first_name;
    $dep_child_surname = $data->dep_child_surname;
    $dep_child_middle_name = $data->dep_child_middle_name;
    $dep_child_state = $data->dep_child_state;
    $dep_child_birthday = $data->dep_child_birthday;
    $dep_child_tin = $data->dep_child_tin;
    $dep_child_relationship_type = $data->dep_child_relationship_type;
    $sponser_first_name = $data->sponser_first_name;
    $sponser_surname = $data->sponser_surname;
    $sponser_middle_name = $data->sponser_middle_name;
    $start_date = $data->start_date;
    $sponser_tin = $data->sponser_tin;


    $query_User_re = sprintf("INSERT INTO `primary_TIN_request`( `user_id`, `title`, `first_name`, `surname`, `middle_name`, `natioality`, `phone_number_1`, `phone_number_2`, `state_of_origin`, `marital_status`, `birthday`, `occupation`, `gender`, `email`, `mother_maiden_name`, `mother_name`, `id_card`, `id_number`, `date_issue`, `expiring_date`, `place_of_issue`, `id_issuing_authority`, `last_assessment_date`, `last_assessment_amount`, `last_payment_date`, `last_payment_amount`, `tax_type`, `first_year`, `first_income`, `second_year`, `second_income`, `third_year`, `third_income`, `reference_number`, `application_status`, `admin_status`) VALUES  ('$user_id','$title','$first_name','$surname','$middle_name','$natioality','$phone_number_1','$phone_number_2','$state_of_origin','$marital_status','$birthday','$occupation','$gender','$email','$mother_maiden_name','$mother_name','$id_card','$id_number','$date_issue','$expiring_date','$place_of_issue','$id_issuing_authority','$last_assessment_date','$last_assessment_amount','$last_payment_date','$last_payment_amount','$tax_type','$first_year','$first_income','$second_year','$second_income','$third_year','$third_income','$reference_number','$application_status','$admin_status')");
    // print_r($query_User_re); die;

    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $primary_TIN_request_id = $ibsConnection->insert_id;


        $query_User_re2 = sprintf("INSERT INTO `secondary_TIN_request`(`primary_TIN_request_id`, `name`, `tin`, `retyp`, `reason`, `state`, `local_gvt`, `ward`, `city`, `street_name`, `house_no`, `phone_number_1`, `phone_number_2`, `email`, `source_of_income`, `employer_name`, `employer_tin`, `start_date_of_employment`, `dep_child_first_name`, `dep_child_surname`, `dep_child_middle_name`, `dep_child_state`, `dep_child_birthday`, `dep_child_tin`, `dep_child_relationship_type`, `sponser_first_name`, `sponser_surname`, `sponser_middle_name`, `start_date`, `sponser_tin`) VALUES ('$primary_TIN_request_id','$name','$tin','$retyp','$reason','$state','$local_gvt','$ward','$city','$street_name','$house_no','$phone_number_1','$phone_number_2','$email','$source_of_income','$employer_name','$employer_tin','$start_date_of_employment','$dep_child_first_name','$dep_child_surname','$dep_child_middle_name','$dep_child_state','$dep_child_birthday','$dep_child_tin','$dep_child_relationship_type','$sponser_first_name','$sponser_surname','$sponser_middle_name','$start_date','$sponser_tin')");
        // print_r($query_User_re2); die;

        $User_re2 = mysqli_query($ibsConnection, $query_User_re2) or die(mysqli_error($ibsConnection));

        if ($User_re2) {
            $check_exist = check_db_query_staus("SELECT reference_number FROM primary_TIN_request  WHERE `user_id`='{$user_id}'", "CHK");

            $arr = [];
          

            $arr[] = ['status' => 1, 'message' => "Tin Request Created successfully"];

              $arr[] = $check_exist['message'];

            exit(json_encode($arr));
        }else {
            $returnResponse = ['status' => 0, 'message' => "Tin Request failed, try again"];
            exit(json_encode($returnResponse));
        }
    } else {
        $returnResponse = ['status' => 0, 'message' => "Tin Request failed, try again"];
        exit(json_encode($returnResponse));
    }


}

function getTaxFiling($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);
    $check_exist = check_db_query_staus1("SELECT * FROM tax_filing  WHERE `user_id`='{$data}'", "CHK");
    if ($check_exist['status'] == 1) {
        exit(json_encode($check_exist));
    } else if ($check_exist['status'] == 0) {
        exit(json_encode($check_exist));
    }

}

function insertTaxFiling($data)
{
    include "config/index.php";
    include "config/enctp.php";
    // print_r($data);die;
    $user_id = $data->user_id;
    $category = $data->category;
    $tax_to_file = $data->tax_to_file;
    $first_name = $data->first_name;
    $surname = $data->surname;
    $email = $data->email;
    $phone_number = $data->phone_number;
    $form_assessment_upload = $data->form_assessment_upload;
    $tax_income_upload = $data->tax_income_upload;
    $evidence_of_tax_payment = $data->evidence_of_tax_payment;
    $tax_filling_refrence = $data->tax_filling_refrence;



    $query_User_re = sprintf("INSERT INTO `tax_filing`(`user_id`, `category`, `tax_to_file`, `first_name`, `surname`, `email`, `phone_number`, `form_assessment_upload`, `tax_income_upload`, `evidence_of_tax_payment`, `tax_filling_refrence`) VALUES ('$user_id', '$category','$tax_to_file','$first_name', '$surname','$email','$phone_number', '$form_assessment_upload','$tax_income_upload','$evidence_of_tax_payment', '$tax_filling_refrence')");
    // print_r($query_User_re); die;
    $User_re = mysqli_query($ibsConnection, $query_User_re) or die(mysqli_error($ibsConnection));

    if ($User_re) {
        $returnResponse = ['status' => 1, 'message' => "Tax Filing Created successfully"];
        exit(json_encode($returnResponse));
    } else {
        $returnResponse = ['status' => 0, 'message' => "failed, try again"];
        exit(json_encode($returnResponse));
    }
}
