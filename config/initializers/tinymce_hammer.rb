Tinymce::Hammer.install_path = '/javascripts/tiny_mce'
Tinymce::Hammer.plugins = ['safari, style, table, paste, spellchecker, tabfocus, print, save']
Tinymce::Hammer.init = [
  [:paste_convert_headers_to_strong, true],
  [:paste_convert_middot_lists, true],
  [:paste_remove_spans, true],
  [:paste_remove_styles, true],
  [:paste_strip_class_attributes, true],
  [:theme, 'advanced'],
  [:theme_advanced_toolbar_align, 'left'],
  [:theme_advanced_toolbar_location, 'top'],
  [:theme_advanced_buttons1, 'undo,redo,cut,copy,paste,pastetext,|,bold,italic,underline,strikethrough,blockquote,charmap,bullist,numlist,removeformat,|,link,unlink,image,|,cleanup,code'],
  [:theme_advanced_buttons2, 'pasteword,|,search,replace,|,tablecontrols,|,justifyleft,justifycenter,justifyright,justifyfull'],
  [:theme_advanced_buttons3, 'styleselect,formatselect,fontselect,fontsizeselect'],
  [:valid_elements, "a[href|title],blockquote[cite],br,caption,cite,code,dl,dt,dd,em,font[height|weight|size|color],h1,h2,h3,h4,h5,h6,i,img[src|alt|title|width|height|align<bottom?left?middle?right?top],li,ol,p,pre,q[cite],small,span,span[style],strike,strong/b,style,sub,sup,u,ul"],
  [:width, '650'],
  [:height, '800'],
]