<?php defined('SYSPATH') OR die('No direct access allowed.');
/*
 * 
		$dpd = new DpdApi();
		$dpd->setHost("https://...");
		$dpd->setFolder(__DIR__.'/../dpd_files');
		$dpd->setLogin("LOGIN");
		$dpd->setPassword("PASSWORD");
		$dpd->setMasterfid(1111);
 */
/*
 *
 
return array(
		'hostname'=>'https://dpdservices.dpd.com.pl/DPDPackageXmlServicesService/DPDPackageXmlServices?wsdl',		
		'username'=>'11277001',
		'password'=>'spSQTZMHtUcymxL4',
		'fid'=>112770,
		'files'=>DOCROOT.'public/dpd',
		'company'=>'Archiwum Depozytowe Sp z o.o.',
		'name'=>'Archiwum Depozytowe',
		'street'=>'Turystyczna 9',
		'city'=>'Lublin',
		'postal'=>'20-207',
		'country_code'=>'PL',
		'phone'=>'+48817489218',
		'email'=>'info@archiwumdepozytowe.pl',
		
);

*/


return array(
		'hostname'=>'https://dpdservicesdemo.dpd.com.pl/DPDPackageXmlServicesService/DPDPackageXmlServices?wsdl',
		'username'=>'test',
		'password'=>'KqvsoFLT2M',
		'fid'=>1495,
		'files'=>DOCROOT.'public/dpd',
		'company'=>'Archiwum Depozytowe Sp z o.o.',
		'name'=>'Archiwum Depozytowe',
		'street'=>'Turystyczna 9',
		'city'=>'Lublin',
		'postal'=>'20-207',
		'country_code'=>'PL',
		'phone'=>'+48817489218',
		'email'=>'info@archiwumdepozytowe.pl',
		'options' => array(),

);
