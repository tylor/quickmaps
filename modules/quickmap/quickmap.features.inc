<?php

/**
 * Implementation of hook_ctools_plugin_api().
 */
function quickmap_ctools_plugin_api() {
  list($module, $api) = func_get_args();
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => 1);
  }
}

/**
 * Implementation of hook_node_info().
 */
function quickmap_node_info() {
  $items = array(
    'location' => array(
      'name' => t('Location'),
      'module' => 'features',
      'description' => t('This is a basic location content type, it has a latitude, a longitude, and a title.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'has_body' => '1',
      'body_label' => t('Body'),
      'min_word_count' => '0',
      'help' => '',
    ),
  );
  return $items;
}

/**
 * Implementation of hook_views_api().
 */
function quickmap_views_api() {
  return array(
    'api' => '2',
  );
}
