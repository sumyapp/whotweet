package whoTweetFrequently.meta;

//@javax.annotation.Generated(value = { "slim3-gen", "@VERSION@" }, date = "2011-03-06 10:40:43")
/** */
public final class TwitterUserMeta extends org.slim3.datastore.ModelMeta<whoTweetFrequently.model.TwitterUser> {

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.lang.Long> accessCount = new org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.lang.Long>(this, "accessCount", "accessCount", java.lang.Long.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.util.Date> createdAt = new org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.util.Date>(this, "createdAt", "createdAt", java.util.Date.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, com.google.appengine.api.datastore.Key> key = new org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, com.google.appengine.api.datastore.Key>(this, "__key__", "key", com.google.appengine.api.datastore.Key.class);

    /** */
    public final org.slim3.datastore.StringAttributeMeta<whoTweetFrequently.model.TwitterUser> screenName = new org.slim3.datastore.StringAttributeMeta<whoTweetFrequently.model.TwitterUser>(this, "screenName", "screenName");

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.lang.Long> twitterId = new org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.lang.Long>(this, "twitterId", "twitterId", java.lang.Long.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.util.Date> updatedAt = new org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.util.Date>(this, "updatedAt", "updatedAt", java.util.Date.class);

    /** */
    public final org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.lang.Long> version = new org.slim3.datastore.CoreAttributeMeta<whoTweetFrequently.model.TwitterUser, java.lang.Long>(this, "version", "version", java.lang.Long.class);

    private static final TwitterUserMeta slim3_singleton = new TwitterUserMeta();

    /**
     * @return the singleton
     */
    public static TwitterUserMeta get() {
       return slim3_singleton;
    }

    /** */
    public TwitterUserMeta() {
        super("TwitterUser", whoTweetFrequently.model.TwitterUser.class);
    }

    @Override
    public whoTweetFrequently.model.TwitterUser entityToModel(com.google.appengine.api.datastore.Entity entity) {
        whoTweetFrequently.model.TwitterUser model = new whoTweetFrequently.model.TwitterUser();
        model.setAccessCount((java.lang.Long) entity.getProperty("accessCount"));
        model.setCreatedAt((java.util.Date) entity.getProperty("createdAt"));
        model.setKey(entity.getKey());
        model.setScreenName((java.lang.String) entity.getProperty("screenName"));
        model.setTwitterId((java.lang.Long) entity.getProperty("twitterId"));
        model.setUpdatedAt((java.util.Date) entity.getProperty("updatedAt"));
        model.setVersion((java.lang.Long) entity.getProperty("version"));
        return model;
    }

    @Override
    public com.google.appengine.api.datastore.Entity modelToEntity(java.lang.Object model) {
        whoTweetFrequently.model.TwitterUser m = (whoTweetFrequently.model.TwitterUser) model;
        com.google.appengine.api.datastore.Entity entity = null;
        if (m.getKey() != null) {
            entity = new com.google.appengine.api.datastore.Entity(m.getKey());
        } else {
            entity = new com.google.appengine.api.datastore.Entity(kind);
        }
        entity.setProperty("accessCount", m.getAccessCount());
        entity.setProperty("createdAt", m.getCreatedAt());
        entity.setProperty("screenName", m.getScreenName());
        entity.setProperty("twitterId", m.getTwitterId());
        entity.setProperty("updatedAt", m.getUpdatedAt());
        entity.setProperty("version", m.getVersion());
        entity.setProperty("slim3.schemaVersion", 1);
        return entity;
    }

    @Override
    protected com.google.appengine.api.datastore.Key getKey(Object model) {
        whoTweetFrequently.model.TwitterUser m = (whoTweetFrequently.model.TwitterUser) model;
        return m.getKey();
    }

    @Override
    protected void setKey(Object model, com.google.appengine.api.datastore.Key key) {
        validateKey(key);
        whoTweetFrequently.model.TwitterUser m = (whoTweetFrequently.model.TwitterUser) model;
        m.setKey(key);
    }

    @Override
    protected long getVersion(Object model) {
        whoTweetFrequently.model.TwitterUser m = (whoTweetFrequently.model.TwitterUser) model;
        return m.getVersion() != null ? m.getVersion().longValue() : 0L;
    }

    @Override
    protected void incrementVersion(Object model) {
        whoTweetFrequently.model.TwitterUser m = (whoTweetFrequently.model.TwitterUser) model;
        long version = m.getVersion() != null ? m.getVersion().longValue() : 0L;
        m.setVersion(Long.valueOf(version + 1L));
    }

    @Override
    protected void prePut(Object model) {
        assignKeyIfNecessary(model);
        incrementVersion(model);
    }

    @Override
    public String getSchemaVersionName() {
        return "slim3.schemaVersion";
    }

    @Override
    public String getClassHierarchyListName() {
        return "slim3.classHierarchyList";
    }

}