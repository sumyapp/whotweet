package whoTweetFrequently.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.RequestToken;

public class SigninController extends Controller {
    public static final String CONSUMER_KEY = "ju7qdNdVJtc0yN672GS1mg";
    public static final String CONSUMER_SECRET =
        "FxNnVWFG4Dd8hGVw7rk74QXM2UjqJz278kLmCwKcf8";

    @Override
    public Navigation run() throws Exception {
        TwitterFactory factory = new TwitterFactory();
        Twitter twitter = factory.getInstance();
        twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);

        request.getSession().setAttribute("twitter", twitter);
        try {
            StringBuffer callbackURL = request.getRequestURL();
            int index = callbackURL.lastIndexOf("/");
            callbackURL.replace(index, callbackURL.length(), "").append(
                "/callback");

            RequestToken requestToken =
                twitter.getOAuthRequestToken(callbackURL.toString());

            request.getSession().setAttribute("requestToken", requestToken);
            // twitterにリダイレクト
            return redirect(requestToken.getAuthenticationURL());
        } catch (TwitterException e) {
            request.setAttribute("errmsg", "Twitterとの通信に失敗しました。時間をおいてお試しください。");
        } catch (Exception e) {
            // エラーの場合
            request.setAttribute("errmsg", "Twitterとの通信に失敗しました。時間をおいてお試しください。");
            return forward("index.jsp");
        }
        // エラーの場合
        return forward("index.jsp");
    }
}
