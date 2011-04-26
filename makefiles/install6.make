;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Makefile for Season CMS Drupal 7 Core    ;
;   © www.season.es 2011                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
core = 6.x
api = 2

projects[] = drupal

projects[] = cck
projects[] = views
projects[] = filefield
projects[] = filefield_sources
projects[] = imagefield
projects[] = link
projects[] = email
projects[] = date
projects[] = imagecache
projects[] = imageapi
projects[] = token
projects[] = lightbox2
projects[] = menutrails
projects[] = nodequeue
projects[] = transliteration
;projects[] = context
;projects[] = features
projects[] = panels
projects[] = ctools
projects[] = simpletest
;projects[] = imce
projects[] = admin
projects[] = taxonomy_menu
projects[] = backup_migrate
projects[] = webform
projects[] = pathauto
projects[] = nodewords
projects[] = wysiwyg
projects[] = insert

projects[] = i18n
projects[] = l10n_client

projects[seasoncms][type] = "profile"
projects[seasoncms][download][type] = "get"
projects[seasoncms][download][url] = "s93-dev.season.es/seasoncms/profiles/season.tar.gz"

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.5/ckeditor_3.5.tar.gz"
libraries[ckeditor][download][directory_name] = ckeditor

;libraries[jquery_ui][download][type] = "get"
;libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.7.2.zip"
;libraries[jquery_ui][directory_name] = jquery.ui
;libraries[jquery_ui][destination] = modules/jquery_ui


projects[] = fusion
projects[] = skinr
projects[] = rubik
projects[] = tao