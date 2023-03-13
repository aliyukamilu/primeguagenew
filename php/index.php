<?php

declare(strict_types=1);
// header('Content-type:application/json;charset=utf-8');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  include 'gate.php';
  if (isset($_GET['login'])) {
    $username = (string) $_GET['email'];
    $password = (string) $_GET['password'];
    login($username, $password);
  } elseif (isset($_GET['loginAdmin'])) {
    $username = (string) $_GET['email'];
    $password = (string) $_GET['password'];
    loginAdmin($username, $password);
  } elseif (isset($_GET['loginMda'])) {
    $username = (string) $_GET['email'];
    $password = (string) $_GET['password'];
    loginMda($username, $password);
  } elseif (isset($_GET['getMDAs'])) {
    getMDAs();
  }elseif (isset($_GET['getAllRevenueHeads'])) {
    getRevenueHead();
  } elseif (isset($_GET['getMDAsRevenueHeads'])) {
    getMDAsRevenueHead($_GET['mdName']);
  } elseif (isset($_GET['getMDAsRevenueHeadId'])) {
    getMDAsRevenueHeadId($_GET['id']);
  } elseif (isset($_GET['getMDA'])) {
    getIndustries();
  } elseif (isset($_GET['updateMDA'])) {
    updateMDA($_GET);
  } elseif (isset($_GET['deleteMDA'])) {
    deleteMDA($_GET['mda_id']);
  } elseif (isset($_GET['deleteRevenueHead'])) {
    deleteRevenueHead($_GET['id']);
  } elseif (isset($_GET['updateRevenueHead'])) {
    updateRevenueHead($_GET);
  } elseif (isset($_GET['generateInvoices'])) {
    generateInvoice($_GET['taxPayerNumber']);
  } elseif (isset($_GET['generateSingleInvoices'])) {
    generateSignleInvoice($_GET);
  } elseif (isset($_GET['updateTaxPayer'])) {
    updateTaxPayer($_GET);
  } elseif (isset($_GET['getTaxPayer'])) {
    getTaxPayerList($_GET);
  } elseif (isset($_GET['getSingleTaxPayer'])) {
    getSingleTaxPayerList($_GET['id']);
  } elseif (isset($_GET['fetchPayment'])) {
    fetchPayment($_GET);
  } elseif (isset($_GET['fetchAllPayment'])) {
    fetchAllPayment();
  } elseif (isset($_GET['AllInvoices'])) {
    getAllInvoice($_GET);
  } elseif (isset($_GET['verifyInvoice'])) {
    verifyInvoice($_GET['invoice_number']);
  } elseif (isset($_GET['userInvoices'])) {
    userInvoices($_GET['payer_id']);
  } elseif (isset($_GET['sendSMS'])) {
    sendSMS($_GET['number'], $_GET['message']);
  } elseif (isset($_GET['getSingleInvoice'])) {
    userInvoiceSingle($_GET['invoiceNumber']);
  } elseif (isset($_GET['getDashboardAnalytics'])) {
    dashboardAnalyticsEndUser($_GET['user_id']);
  } elseif (isset($_GET['UpdateTaxPayersTINStatus'])) {
    UpdateTINStatus($_GET);
  } elseif (isset($_GET['usersParticularMDA'])) {
    ParticularMDAUsers($_GET['mda_id']);
  } elseif (isset($_GET['updatePendingPayentStatus'])) {
    updatePendingPayentStatus($_GET['user_id']);
  } elseif (isset($_GET['getDashboardAnalyticsAdmin'])) {
    dashboardAnalyticsAdmin();
  } elseif (isset($_GET['getAdminUser'])) {
    getAdminUsers();
  } elseif (isset($_GET['updateAdminUser'])) {
    updateAdminUser($_GET);
  } elseif (isset($_GET['deleteAdminUser'])) {
    deleteAdminUser($_GET['id']);
  } elseif (isset($_GET['getMDACollections'])) {
    getMDACollectionPayments($_GET['mda_id']);
  } elseif (isset($_GET['updateMDAUser'])) {
    updateMDAUser($_GET);
  } elseif (isset($_GET['deleteMDAUser'])) {
    deleteMDAUser($_GET['id']);
  } elseif (isset($_GET['sendEmail'])) {
    verifyEmail($_GET['id']);
  } elseif (isset($_GET['activateAcount'])) {
    UpdateAccountStatus($_GET);
  } elseif (isset($_GET['smsVerify'])) {
    verifySms($_GET);
  } elseif (isset($_GET['smsUpdateAccount'])) {
    UpdateAccountStatusSms($_GET);
  } elseif (isset($_GET['getMDAsCount'])) {
    getMDAsCount();
  } elseif (isset($_GET['getRevenueCount'])) {
    getRevenueCount();
  } elseif (isset($_GET['verifyAdminUser'])) {
    verifyAdminUser($_GET);
  } elseif (isset($_GET['sendContactEmail'])) {
    sendContactEmail($_GET);
  } elseif (isset($_GET['getBanners'])) {
    getBanners($_GET);
  } elseif (isset($_GET['deleteBanner'])) {
    deleteBanner($_GET['id']);
  } elseif (isset($_GET['getContactUs'])) {
    getContactUs($_GET);
  } elseif (isset($_GET['getOurServices'])) {
    getOurServices($_GET);
  } elseif (isset($_GET['deleteOurServices'])) {
    deleteOurServices($_GET['id']);
  } elseif (isset($_GET['userProfile'])) {
    userProfile($_GET['id']);
  }elseif (isset($_GET['userPassword'])) {
    updatePassword($_GET);
  }elseif (isset($_GET['getTaxClearanceCert'])) {
    getTaxClearanceCert($_GET['user_id']);
  }elseif (isset($_GET['getTINRequest'])) {
    getTINRequest($_GET['user_id']);
  }elseif (isset($_GET['getTaxFiling'])) {
    getTaxFiling($_GET['user_id']);
  }
} elseif ($_SERVER['REQUEST_METHOD'] == 'POST') {
  include 'gate.php';
  $entityBody = file_get_contents('php://input');
  // price_update_add($entityBody);
  if (!empty($entityBody)) {
    $data = (array) json_decode($entityBody);
    if ($data['endpoint'] == "createAdmin") {
      createUser($data['data']);
    } elseif ($data['endpoint'] == "createMDA") {
      createMDA($data['data']);
    } elseif ($data['endpoint'] == "createMultipleMDA") {
      createMultipleMDAs($data['data']);
      //  print_r($data['data']);
    } elseif ($data['endpoint'] == "createMDAPaymentForm") {
      createMDAPaymentForm($data['data']);
    } elseif ($data['endpoint'] == "createMDArHead") {
      createMDARevenueHeads($data['data']);
    } elseif ($data['endpoint'] == "createMultplerHead") {
      createMultpleMDARevenueHeads($data['data']);
      // print_r($data['data']);
    } elseif ($data['endpoint'] == "createInvidualPayment") {
      paymentToMDARevenueHeads($data['data']);
    } elseif ($data['endpoint'] == "createPayerAccount") {
      createPayerUser($data['data']);
    } elseif ($data['endpoint'] == "sendSMS") {
      createPayerUser($data['data']);
    } elseif ($data['endpoint'] == "createMDAUser") {
      createMDAUser($data['data']);
    } elseif ($data['endpoint'] == "pendingPaymentList") {
      pendingPaymentList($data['data']);
    } elseif ($data['endpoint'] == "updatePix") {
      updateProfillePix($data['data']);
    } elseif ($data['endpoint'] == "createBanners") {
      createBanners($data['data']);
    } elseif ($data['endpoint'] == "insertContactUs") {
      insertContactUs($data['data']);
    } elseif ($data['endpoint'] == "insertOurServices") {
      insertOurServices($data['data']);
    } elseif ($data['endpoint'] == "createTaxClearanceCert") {
      // print_r($data['data']);
      createTaxClearanceCert($data['data']);
    } elseif ($data['endpoint'] == "createTINRequest") {
      // print_r($data['data']);
      createTINRequest($data['data']);
    }elseif ($data['endpoint'] == "insertTaxFiling") {
      // print_r($data['data']);
      insertTaxFiling($data['data']);
    }
  }
} elseif ($_SERVER['REQUEST_METHOD'] == 'PUT') {
  include 'gate.php';
  $entityBody = file_get_contents('php://input');
  // price_update_add($entityBody);
  if (!empty($entityBody)) {
    $data = (array) json_decode($entityBody);
    if ($data['endpoint'] == "updateProfile") {
      // print_r($data['data']);
      updateProfile($data['data']);
    } elseif ($data['endpoint'] == "updateBanners") {
      // print_r($data['data']);
      updateBanners($data['data']);
    } elseif ($data['endpoint'] == "updateOurServices") {
      // print_r($data['data']);
      updateOurServices($data['data']);
    } elseif ($data['endpoint'] == "updateContactUs") {
      // print_r($data['data']);
      updateContactUs($data['data']);
    }
  }
}
