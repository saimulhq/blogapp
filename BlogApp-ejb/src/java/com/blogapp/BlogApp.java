package com.blogapp;

import com.blogapp.entities.Blogs;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class BlogApp implements BlogAppRemote {
    
    @PersistenceContext(unitName = "BlogApp-ejbPU")
    private EntityManager em;
    
    Blogs blog;

    @Override
    public void addPostsInDatabase(Blogs blog){
        em.persist(blog);
    }
    
    @Override
    public List<Blogs> getPostsList() {
        return em.createNativeQuery("select * from blogs order by postdate asc", Blogs.class).getResultList();
    }
    
    @Override
    public Blogs getPostInfo(int id) {
        return (Blogs) em.createNativeQuery("select * from blogs where blogid=?1", Blogs.class).setParameter(1, id).getSingleResult();
    }
    
    @Override
    public void deletePost(int id) {
        String query = "delete from blogs where blogid=?1";
        em.createNativeQuery(query).setParameter(1, id).executeUpdate();
    }
    
    @Override
    public void updatePostsInDatabase(Blogs blog){
        em.merge(blog);
    }
}
