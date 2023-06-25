package kr.co.book.mypage.dto;

import java.util.List;

public class AladinDTO {
	
	private String title;
	private String link;
	private String imageUrl;
	private String version;
	private String pubDate;
	private String totalResults;
	private String startIndex;
	private String itemsPerPage;
	private String query;
	private String searchCategoryId;
	private String searchCategoryName;
	private String logo;
	private List<TrackerDTO> item;	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getTotalResults() {
		return totalResults;
	}
	public void setTotalResults(String totalResults) {
		this.totalResults = totalResults;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getItemsPerPage() {
		return itemsPerPage;
	}
	public void setItemsPerPage(String itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String getSearchCategoryId() {
		return searchCategoryId;
	}
	public void setSearchCategoryId(String searchCategoryId) {
		this.searchCategoryId = searchCategoryId;
	}
	public String getSearchCategoryName() {
		return searchCategoryName;
	}
	public void setSearchCategoryName(String searchCategoryName) {
		this.searchCategoryName = searchCategoryName;
	}
	public List<TrackerDTO> getItem() {
		return item;
	}
	public void setItem(List<TrackerDTO> item) {
		this.item = item;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}

}
