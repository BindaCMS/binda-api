Deface::Override.new  :virtual_path => "layouts/binda/_sidebar",
                      :name => 'main_sidebar',
                      :insert_after => "[data-hook='main-sidebar-manage-users']",
                      :partial => 'shared/api_users'
