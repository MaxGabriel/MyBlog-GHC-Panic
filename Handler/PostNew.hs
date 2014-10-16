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
    defaultLayout $ do
        $(widgetFile "posts/new")

postPostNewR :: Handler Html
postPostNewR = error "Implement this function"