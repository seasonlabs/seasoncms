<?php
// $Id$

/**
 * Implementation of hook_profile_details().
 */
function seasoncms_profile_details() {
  return array(
    'name' => 'Season CMS',
    'description' => 'Season CMS By Season'
  );
}

/**
 * Implementation of hook_profile_modules().
 */
function seasoncms_profile_modules() {
  $modules = array(
     // Drupal core
    'block',
    'comment',
    'contact',
    'dblog',
    'filter',
    'help',
    'menu',
    'node',
    'search',
    'system', 
    'taxonomy',
    'user',
    'path',
    //CCK
    'content', 'optionwidgets',
    // Admin
    'admin_menu',
    // Views
    'views', 'views_ui',
    // Context
    'context', 'context_ui',
    // Date
    //'date_api', 'date_timezone',
    // Features
    'features',
    // Image
    'imageapi', 'imageapi_gd', 'imagecache', 'imagecache_ui',
    // Token
    'token',
    // Transliteration
    'transliteration',
    'pathauto',
    //'logintoboggan',
    'captcha',
    'nodewords',
    'taxonomy_manager',
    'wysiwyg'
  );

  // If language is not English we add the 'atrium_translate' module the first
  // To get some modules installed properly we need to have translations loaded
  // We also use it to check connectivity with the translation server on hook_requirements()
  if (_seasoncms_language_selected()) {
    // We need locale before l10n_update because it adds fields to locale tables
    $modules[] = 'locale';
    $modules[] = 'l10n_update';
    $modules[] = 'i18n';
    $modules[] = 'l10n_client';
  }

  return $modules;
}


/**
 * Check whether we are installing in a language other than English
 */
function _seasoncms_language_selected() {
  global $install_locale;
  return !empty($install_locale) && ($install_locale != 'en');
}


/**
 * Set English as default language.
 * 
 * If no language selected, the installation crashes. I guess English should be the default 
 * but it isn't in the default install. @todo research, core bug?
 */
function system_form_install_select_locale_form_alter(&$form, $form_state) {
  $form['locale']['en']['#value'] = 'en';
}

/**
 * Perform any final installation tasks for this profile.
 *
 * The installer goes through the profile-select -> locale-select
 * -> requirements -> database -> profile-install-batch
 * -> locale-initial-batch -> configure -> locale-remaining-batch
 * -> finished -> done tasks, in this order, if you don't implement
 * this function in your profile.
 *
 * If this function is implemented, you can have any number of
 * custom tasks to perform after 'configure', implementing a state
 * machine here to walk the user through those tasks. First time,
 * this function gets called with $task set to 'profile', and you
 * can advance to further tasks by setting $task to your tasks'
 * identifiers, used as array keys in the hook_profile_task_list()
 * above. You must avoid the reserved tasks listed in
 * install_reserved_tasks(). If you implement your custom tasks,
 * this function will get called in every HTTP request (for form
 * processing, printing your information screens and so on) until
 * you advance to the 'profile-finished' task, with which you
 * hand control back to the installer. Each custom page you
 * return needs to provide a way to continue, such as a form
 * submission or a link. You should also set custom page titles.
 *
 * You should define the list of custom tasks you implement by
 * returning an array of them in hook_profile_task_list(), as these
 * show up in the list of tasks on the installer user interface.
 *
 * Remember that the user will be able to reload the pages multiple
 * times, so you might want to use variable_set() and variable_get()
 * to remember your data and control further processing, if $task
 * is insufficient. Should a profile want to display a form here,
 * it can; the form should set '#redirect' to FALSE, and rely on
 * an action in the submit handler, such as variable_set(), to
 * detect submission and proceed to further tasks. See the configuration
 * form handling code in install_tasks() for an example.
 *
 * Important: Any temporary variables should be removed using
 * variable_del() before advancing to the 'profile-finished' phase.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */
function seasoncms_profile_tasks(&$task, $url) {

  // Insert default user-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: http://api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site's initial home page."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
    array(
      'type' => 'story',
      'name' => st('Story'),
      'module' => 'node',
      'description' => st("A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site's initial home page, and provides the ability to post comments."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  // Don't display date and author information for page nodes by default.
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);

  // Update the menu router information.
  menu_rebuild();

  // Turn on LoginToboggan features
  variable_set('login_with_mail', 1);
  variable_set('email_reg_confirm', 1);
  variable_set('reg_passwd_set', 1);
  variable_set('toboggan_immed_login', 1);
  variable_set('toboggan_role', 4);
  variable_set('toboggan_hijack', 1);
  
  // Set welcome message for anonymous users
  variable_set('front_page', 'Welcome to '. variable_get('site_name', 'Season CMS') .'!');

  // Set default theme. This needes some more set up on next page load
  // We cannot do everything here because of _system_theme_data() static cache
  system_theme_data();
  db_query("UPDATE {system} SET status = 0 WHERE type = 'theme' and name ='%s'", 'garland');
  variable_set('theme_default', 'active');
  
  // Disable default logo and enter new logo path
  variable_set('theme_singular_settings', array(
    'default_logo' => 0,
    'logo_path' => 'themes/active/images/season-header.png',
    'toggle_name' => 1,
    'toggle_slogan' => 0,
    'toggle_mission' => 1,
    'toggle_primary_links' => 1,
    'toggle_secondary_links' => 1,
    'toggle_comment_user_picture' => 0,
    'toggle_search' => 0,
  ));

  // Set a default footer message.
  variable_set('site_footer', '&copy; '. date('Y') . ' ' . l('Season Advertising S.L.', 'http://www.season.es', array('absolute' => TRUE)));

}
