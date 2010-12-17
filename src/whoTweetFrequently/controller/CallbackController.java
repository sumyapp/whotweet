package whoTweetFrequently.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.http.RequestToken;

public class CallbackController extends Controller {

    @Override
    public Navigation run() throws Exception {
        Twitter twitter =
            (Twitter) request.getSession().getAttribute("twitter");
        RequestToken requestToken =
            (RequestToken) request.getSession().getAttribute("requestToken");
        String verifier = request.getParameter("oauth_verifier");
        try {
            twitter.getOAuthAccessToken(requestToken, verifier);
            request.getSession().removeAttribute("requestToken");
        } catch (TwitterException e) {
            // エラーの場合
            request.setAttribute("errmsg", "例外エラーが発生しました。時間をおいてお試しください。");
            return forward("index.jsp");
        }

        return redirect("/result");
    }

}
