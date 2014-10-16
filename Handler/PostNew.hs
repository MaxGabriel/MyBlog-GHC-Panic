module Handler.PostNew where

import Import
import Data.Coerce

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
    FormSuccess form -> do
                    _ <- runDB $ insert $ BlogPost { blogPostTitle = (title form)
                                                   , blogPostArticle = coerce (article form)
                                                   }
                    error "todo"
    _ -> defaultLayout $(widgetFile "posts/new")