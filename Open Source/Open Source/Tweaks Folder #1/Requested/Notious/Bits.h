@interface NCNotificationNoContentView : UIView <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end


/* -- Notes Placeholder -- */
       UITextView *textView;
       UIButton *button;
      
       UIImageView *iconView;

       UIView *base;
       UIView *header;


/* -- Image Placeholder -- */
       UIButton *addButton;
      
       UIImageView *imageView;
       UIImage *chosen;

       UIView *imageBase;
       UIView *imageHeader;