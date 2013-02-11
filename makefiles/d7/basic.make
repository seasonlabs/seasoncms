; Basic contributed modules.
projects[ctools][version] = 1.2
projects[ctools][subdir] = "contrib"
projects[ctools][patch][] = "http://drupal.org/files/autosubmit_enhanced_textfield-1694988-4.patch"
projects[entity][version] = 1.0
projects[entity][subdir] = "contrib"
projects[entityreference][version] = 1.0
projects[entityreference][subdir] = "contrib"
projects[entityreference][patch][] = "http://drupal.org/files/1580348-universal-formatters-11.patch"
projects[rules][version] = 2.2
projects[rules][subdir] = "contrib"
projects[views][version] = 3.5
projects[views][subdir] = "contrib"
projects[views][patch][] = "http://drupal.org/files/views-exposed-form-reset-redirect-1807916-4.patch"
projects[views_bulk_operations][version] = 3.1
projects[views_bulk_operations][subdir] = "contrib"
projects[addressfield][version] = 1.0-beta3
projects[addressfield][subdir] = "contrib"
projects[features][version] = 1.0
projects[features][patch][] = "http://drupal.org/files/1572578-part-one.patch"
projects[features][patch][] = "http://drupal.org/files/1597186-1-features-do-not-cache-includes.patch"
projects[features][patch][] = "http://drupal.org/files/927566-multiple-link_path.patch"
projects[features][patch][] = "http://drupal.org/files/1669720-fix-features-flush-cache.patch"
projects[features][subdir] = "contrib"
projects[strongarm][version] = 2.0
projects[strongarm][subdir] = "contrib"
projects[taxonomy_menu][version] = 1.4
projects[taxonomy_menu][subdir] = "contrib"
projects[libraries][version] = 2.0
projects[libraries][subdir] = "contrib"
projects[views_megarow][version] = 1.0
projects[views_megarow][subdir] = "contrib"
projects[crumbs][version] = 1.8
projects[crumbs][patch][] = "http://drupal.org/files/crumbs-7.x-1.x-fix-taxonomy-term-uri-hardcode-1850860-10.patch"
projects[crumbs][subdir] = "contrib"
projects[token][version] = 1.4
projects[token][subdir] = "contrib"
projects[token][patch][] = "http://drupal.org/files/token-token_asort_tokens-1712336_0.patch"
projects[date][version] = 2.6
projects[date][subdir] = "contrib"
projects[fences][version] = "1.0"
projects[fences][subdir] = "contrib"
projects[fences][patch][] = "http://drupal.org/files/undefined-index-1561244-7.patch"
projects[title][version] = "1.0-alpha5"
projects[title][patch][] = "http://drupal.org/files/title-fix-hook-field-attach-create-bundle-1869438-2.patch"
projects[title][patch][] = "http://drupal.org/files/title-fix-empty-class-in-title-1885358-4.patch"
projects[title][subdir] = "contrib"
projects[node_export][version] = 3.0
projects[node_export][subdir] = "contrib"
projects[pathauto][version] = 1.2
projects[pathauto][subdir] = "contrib"
projects[chosen][version] = 1.x-dev
projects[chosen][subdir] = "contrib"

; Internationalization
projects[variable][version] = "2.x-dev"
projects[variable][subdir] = "contrib"
projects[i18n][version] = "1.x-dev"
projects[i18n][subdir] = "contrib"

; Base theme.
projects[omega][version] = 3.1
projects[omega][subdir] = "contrib"
projects[omega_kickstart][version] = 3.0
projects[omega_kickstart][patch][] = "http://drupal.org/files/omega_kickstart-fix-omega-php-memory-overflow-1814350-11.patch"
projects[omega_kickstart][subdir] = "contrib"

libraries[chosen][type] = "libraries"
libraries[chosen][download][type] = "git"
libraries[chosen][download][url] = "https://github.com/harvesthq/chosen.git"
libraries[chosen][overwrite] = TRUE

; CKEditor
libraries[ckeditor][download][type]= "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.6.6/ckeditor_3.6.6.zip"
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][destination] = "libraries"
