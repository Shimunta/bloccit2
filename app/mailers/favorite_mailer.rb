class FavoriteMailer < ApplicationMailer
  default from: "danlisa89@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@secure-citadel.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@secure-citadel.com>"
    headers["References"] = "<post/#{post.id}@secure-citadel.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, cc: "danlisa89@gmail.com", subject: "New comment on #{post.title}")
  end
end
