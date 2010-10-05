<?php

/**
 * Implementation of hook_content_default_fields().
 */
function quickmap_content_default_fields() {
  $fields = array();

  // Exported field: field_latitude
  $fields['location-field_latitude'] = array(
    'field_name' => 'field_latitude',
    'type_name' => 'location',
    'display_settings' => array(
      'label' => array(
        'format' => 'above',
        'exclude' => 0,
      ),
      'teaser' => array(
        'format' => 'default',
        'exclude' => 0,
      ),
      'full' => array(
        'format' => 'default',
        'exclude' => 0,
      ),
      '4' => array(
        'format' => 'default',
        'exclude' => 0,
      ),
    ),
    'widget_active' => '1',
    'type' => 'text',
    'required' => '1',
    'multiple' => '0',
    'module' => 'text',
    'active' => '1',
    'text_processing' => '0',
    'max_length' => '',
    'allowed_values' => '',
    'allowed_values_php' => '',
    'widget' => array(
      'rows' => 5,
      'size' => '60',
      'default_value' => array(
        '0' => array(
          'value' => '',
          '_error_element' => 'default_value_widget][field_latitude][0][value',
        ),
      ),
      'default_value_php' => NULL,
      'label' => 'Latitude',
      'weight' => '-4',
      'description' => 'Please specify the latitude in degrees decimal. For example: \'49.282812\'.',
      'type' => 'text_textfield',
      'module' => 'text',
    ),
  );

  // Exported field: field_longitude
  $fields['location-field_longitude'] = array(
    'field_name' => 'field_longitude',
    'type_name' => 'location',
    'display_settings' => array(
      'label' => array(
        'format' => 'above',
        'exclude' => 0,
      ),
      'teaser' => array(
        'format' => 'default',
        'exclude' => 0,
      ),
      'full' => array(
        'format' => 'default',
        'exclude' => 0,
      ),
      '4' => array(
        'format' => 'default',
        'exclude' => 0,
      ),
    ),
    'widget_active' => '1',
    'type' => 'text',
    'required' => '1',
    'multiple' => '0',
    'module' => 'text',
    'active' => '1',
    'text_processing' => '0',
    'max_length' => '',
    'allowed_values' => '',
    'allowed_values_php' => '',
    'widget' => array(
      'rows' => 5,
      'size' => '60',
      'default_value' => array(
        '0' => array(
          'value' => '',
          '_error_element' => 'default_value_widget][field_longitude][0][value',
        ),
      ),
      'default_value_php' => NULL,
      'label' => 'Longitude',
      'weight' => '-3',
      'description' => 'Please specify the longitude in degrees decimal. For example: \'-123.126869\'.',
      'type' => 'text_textfield',
      'module' => 'text',
    ),
  );

  // Translatables
  // Included for use with string extractors like potx.
  t('Latitude');
  t('Longitude');

  return $fields;
}
