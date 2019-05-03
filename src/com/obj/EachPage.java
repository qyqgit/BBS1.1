package com.obj;

import java.util.ArrayList;

public class EachPage {
    private int pageLength;
    private int pageNumber;
    private int pageIndex;
    private int pageCount;
    private int listLength;
    private int howManyPage;
    private ArrayList<EachPage> eachPageList;
    
    public int getPageLength() {
        return pageLength;
    }
    public void setPageLength(int pageLength) {
        this.pageLength = pageLength;
    }
    public int getPageNumber() {
        return pageNumber;
    }
    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }
    public int getPageIndex() {
        return pageIndex;
    }
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }
    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
    public int getListLength() {
        return listLength;
    }
    public void setListLength(int listLengh) {
        this.listLength = listLengh;
    }
    
    public int getHowManyPage() {
        return howManyPage;
    }
    public void setHowManyPage(int howManyPage) {
        this.howManyPage = howManyPage;
    }
    public ArrayList<EachPage> getEachPageList() {
        return eachPageList;
    }
    public void setEachPageList(ArrayList<EachPage> eachPageList) {
        this.eachPageList = eachPageList;
    }
    
    public EachPage(int pageLength, int pageCount, int listLength, int pageNumber) {
        super();
        howManyPage = pageCount % pageLength == 0 ? pageCount / pageLength : (pageCount / pageLength) +1 ;
        int whereStart = howManyPage - (howManyPage % listLength);
        if(whereStart == howManyPage) {
            whereStart = whereStart - listLength;
        }
        this.pageLength = pageLength;
        this.pageCount = pageCount;
        this.listLength = listLength;
        this.pageNumber = pageNumber;
        this.pageIndex = (pageNumber - 1) * pageLength;
        if(pageNumber > whereStart) {
            if(howManyPage%listLength == 0)
                this.listLength = listLength;
            else {
                this.listLength = howManyPage % listLength;
            }
        }
        else 
            this.listLength = listLength;
        this.eachPageList = new ArrayList<EachPage>();
        if(this.listLength < listLength) {
            for(int i = 0; i < this.listLength; i++) {
                this.eachPageList.add(new EachPage(this.pageLength, this.pageCount, listLength, whereStart+1+i, this.eachPageList));
            }
        } else {
            for(int i = 0; i < this.listLength; i++) {
                this.eachPageList.add(new EachPage(this.pageLength, this.pageCount, listLength, (this.pageNumber - 1)  / listLength * listLength + i + 1, this.eachPageList));
            }
        }

        
    }
    

    private EachPage(int pageLength, int pageCount, int listLength, int pageNumber,
            ArrayList<EachPage> eachPageList) {
        super();
        int whereStart = howManyPage - (howManyPage % listLength);
        if(whereStart == howManyPage) {
            whereStart = whereStart - listLength;
        }
        this.pageLength = pageLength;
        this.pageNumber = pageNumber;
        this.listLength = listLength;
        this.pageCount = pageCount;
        this.pageIndex = (pageNumber -1) * pageLength;
        if(pageNumber > whereStart) {
            if(howManyPage%listLength == 0)
                this.listLength = listLength;
            else {
                this.listLength = howManyPage % listLength;
            }
        }
        else 
            this.listLength = listLength;
        this.eachPageList = eachPageList;
    }
    
}
