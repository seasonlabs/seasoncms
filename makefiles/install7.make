;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Makefile for Season CMS Drupal 7 Core    ;
;   © www.season.es 2011                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
core = 7.x
api = 2

projects[] = drupal

projects[] = views
;projects[] = link
;projects[] = email
projects[] = date
projects[] = token
projects[] = lightbox2
;projects[] = nodequeue
projects[] = transliteration
projects[] = panels
projects[] = ctools
projects[] = wysiwyg
projects[] = insert
projects[] = taxonomy_menu
projects[] = backup_migrate
projects[] = webform
projects[] = pathauto

projects[] = i18n
projects[] = l10n_client

;;
; Themes
projects[] = fusion
projects[] = skinr
projects[] = rubik
projects[] = tao

;;
; Libraries

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.5/ckeditor_3.5.tar.gz"
libraries[ckeditor][download][directory_name] = ckeditor

;libraries[jquery_ui][download][type] = "get"
;libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.7.2.zip"
;libraries[jquery_ui][directory_name] = jquery.ui
;libraries[jquery_ui][destination] = modules/jquery_ui


