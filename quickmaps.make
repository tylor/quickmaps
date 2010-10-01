core = 6.x

; Contrib

projects[admin][subdir] = "contrib"
projects[admin][version] = "2.0"

projects[views][subdir] = "contrib"
projects[views][version] = "2.11"

projects[cck][subdir] = "contrib"
projects[cck][version] = "2.8"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.7"

projects[features][subdir] = "contrib"
projects[features][version] = "1.0"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[gmap][subdir] = "contrib"
projects[gmap][version] = "1.1"

projects[node_import][subdir] = "contrib"
projects[node_import][version] = "1.x-dev"

projects[node_import][type] = "module"
projects[node_import][download][type] = "cvs"
projects[node_import][download][module] = "contributions/modules/node_import"
projects[node_import][download][revision] = "DRUPAL-6--1:2010-09-30"
; Fix PHP 5.3 error: http://drupal.org/node/763036#comment-3517142
projects[node_import][patch][] = "http://drupal.org/files/issues/node_import_php5.3_fix.patch"

; Dependencies of node_import
projects[date][subdir] = "contrib"
projects[date][version] = "2.6"
