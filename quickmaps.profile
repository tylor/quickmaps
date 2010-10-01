<?php
// $Id$

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function quickmaps_profile_details() {
  return array(
    'name' => 'Quickmaps',
    'description' => 'A simple, lean mapping installation profile.'
  );
}

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function quickmaps_profile_modules() {
  return array(
  // Core
  'menu',
  // Contrib
  'admin', 'content', 'text', 'ctools', 'features', 'strongarm', 'gmap',
  'date_api', 'date', 'node_import', 'views', 
  // Features
  'quickmap',
  );
}

/**
 * Return a list of tasks that this profile supports. We want to enter a
 * Google Maps API key before the site is ready for use.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function quickmaps_profile_task_list() {
  return array(
    'gmap' => st('GMap API Key'),
  );
}

/**
 * Do any tasks then take over installer and run our own install task.
 */
function quickmaps_profile_tasks(&$task, $url) {
  // Get control of installer.
  if ($task == 'profile') {
    $task = 'gmap';
  }
  
  if ($task == 'gmap') {
    // Render form.
    $output = drupal_get_form('quickmaps_profile_gmaps_form', $url);
    
    // Check for submit by seeing if we have our key.
    if (!variable_get('googlemap_api_key', FALSE)) {
      drupal_set_title(st('Google Maps API Key'));
      return $output;
    }
    else {
      drupal_flush_all_caches(); // Definitely needed to build location fields.
      $task = 'profile-finished';
    }
  }
}

/**
 * Form for the Google Maps API key.
 */
function quickmaps_profile_gmaps_form(&$form_state, $url) {
  $form['googlemap_api_key'] = array(
    '#type' => 'textfield',
    '#title' => st('Google Maps API Key'),
    '#default_value' => NULL,
    '#description' => st('To complete installation, please enter your Google Maps API key. If you do not have one, get it <a href="http://code.google.com/apis/maps/signup.html">here</a>.'),
    '#required' => TRUE,
  );
  $form['continue'] = array(
    '#type' => 'submit',
    '#value' => st('Continue'),
  );
  $form['errors'] = array();
  $form['#action'] = $url;
  $form['#redirect'] = FALSE;
  return $form;
}

/**
 * Submit handler for Google Maps API key.
 */
function quickmaps_profile_gmaps_form_submit($form, &$form_state) {
  // Can't use variable_set() since we need all the GMap default values. 
  // Instead execute the form programmatically and have it populated.
  $values = array(
    'values' => array(
      'googlemap_api_key' => $form_state['values']['googlemap_api_key']
    )
  );
  require_once(drupal_get_path('module', 'gmap') . '/gmap_settings_ui.inc');
  drupal_execute('gmap_admin_settings', $values);
}

/**
 * Set Quickmaps as default install profile.
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  foreach($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'quickmaps';
  }
}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function quickmaps_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
    $form['site_information']['site_mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST'];
    $form['admin_account']['account']['name']['#default_value'] = 'admin';
    $form['admin_account']['account']['mail']['#default_value'] = 'admin@'. $_SERVER['HTTP_HOST'];
  }
}