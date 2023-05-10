<?php

if (!defined('TYPO3_MODE')) {
  die ('Access denied.');
}

$applicationContext = \TYPO3\CMS\Core\Utility\GeneralUtility::getApplicationContext()->__toString();

// Overwrite TYPO3_CONF_VARS
$typo3Configuration = [
  'DB' => [
    'database' => $_ENV['MYSQL_DATABASE'],
    'host' => $_ENV['MYSQL_HOST'],
    'password' => $_ENV['MYSQL_PASSWORD'],
    'socket' => $_ENV['MYSQL_SOCKET'],
    'username' => $_ENV['MYSQL_USER'],
  ]
];

$GLOBALS['TYPO3_CONF_VARS'] = array_replace_recursive($GLOBALS['TYPO3_CONF_VARS'], (array) $typo3Configuration);

// Load any application-context dependant AdditionalConfiguration.php files and
// apply their TYPO3_CONF_VARS overwrite.
$contextDependantAdditionalConfiguration = realpath(__DIR__) . '/AdditionalConfiguration_' . strtolower($applicationContext) . '.php';
if (is_file($contextDependantAdditionalConfiguration)) {
  include_once($contextDependantAdditionalConfiguration);
  $GLOBALS['TYPO3_CONF_VARS'] = array_replace_recursive($GLOBALS['TYPO3_CONF_VARS'], (array) $typo3Configuration);
}

?>