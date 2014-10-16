module Handler.PostNew where

import Import

data BlogPostForm = BlogPostForm
  { title :: Text
  , article :: Textarea
  }

blogPostForm :: AForm Handler BlogPostForm
blogPostForm = BlogPostForm
        <$> areq textField "Title" Nothing
        <*> areq textareaField "Article" Nothing

getPostNewR :: Handler Html
getPostNewR = do
    (widget, enctype) <- generateFormPost $ renderBootstrap blogPostForm
    defaultLayout $ do
        $(widgetFile "posts/new")

postPostNewR :: Handler Html
postPostNewR = do
  ((res, widget), enctype) <- runFormPost $ renderBootstrap blogPostForm
  case res of
    FormSuccess form -> error "todo"
    _ -> defaultLayout $(widgetFile "posts/new")