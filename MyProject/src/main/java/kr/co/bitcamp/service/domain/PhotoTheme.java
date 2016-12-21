package kr.co.bitcamp.service.domain;

import java.util.List;

public class PhotoTheme {
    
    private int themeNo;
    private String themeName;
    private List<Photo> photoList;

    public PhotoTheme() {
        // TODO Auto-generated constructor stub
    }

    public int getThemeNo() {
        return themeNo;
    }

    public void setThemeNo(int themeNo) {
        this.themeNo = themeNo;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public List<Photo> getPhotoList() {
        return photoList;
    }

    public void setPhotoList(List<Photo> photoList) {
        this.photoList = photoList;
    }

    @Override
    public String toString() {
        return "PhotoTheme [themeNo=" + themeNo + ", themeName=" + themeName + ", photoList=" + photoList + "]";
    }
    
    

}
