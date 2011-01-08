package whoTweetFrequently.model;

import java.io.Serializable;
import java.util.Date;

import twitter4j.User;

public class TweetCount implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = -3429920399490070561L;

    /** TwitterのUserモデル */
    private User user;

    /** tweetした数 */
    private int tweetCount;

    /** 本Modelの作成日 */
    private Date createdAt;

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user
     *            the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the tweetCount
     */
    public int getTweetCount() {
        return tweetCount;
    }

    /**
     * @param tweetCount
     *            the tweetCount to set
     */
    public void setTweetCount(int tweetCount) {
        this.tweetCount = tweetCount;
    }

    /**
     * @return the createdAt
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * @param createdAt
     *            the createdAt to set
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "TweetCount [user="
            + user
            + ", tweetCount="
            + tweetCount
            + ", createdAt="
            + createdAt
            + "]";
    }

}
