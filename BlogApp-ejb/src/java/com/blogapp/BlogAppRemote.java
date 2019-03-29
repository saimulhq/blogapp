package com.blogapp;

import com.blogapp.entities.Blogs;
import java.util.List;
import javax.ejb.Remote;

@Remote
public interface BlogAppRemote {
    public void addPostsInDatabase(Blogs blog);
    
    public List<Blogs> getPostsList();
    
    public Blogs getPostInfo(int id);
    
    public void deletePost(int id);
    
    public void updatePostsInDatabase(Blogs blog);
}
