package babystep.api.model

import org.apache.ibatis.annotations.AutomapConstructor

//求人一覧検索用
data class FindJobsSearchCondition @AutomapConstructor constructor(
        val workerId: Long,
        val searchWord: String? = null,
        val jobCategoryId: Long? = null,
        val tagIds: List<Long>? = null
)

//求人一覧検索結果用
data class FindJobsSearchResult @AutomapConstructor constructor(
        val id: Long,
        val jobCategoryId: Long,
        val jobCategoryTitle: String,
        val jobTitle: String,
        val description: String,
        val desireDateTime: String,
        val place: String,
//        val tags: List<Tag>?, TODO　Mybatisから取得できるように修正
        val likeFlg: Boolean,
        val helpFlg: Boolean
)

data class GetJobDetailSearchCondition @AutomapConstructor constructor(
        val workerId: Long,
        val jobId: Long
)

data class GetJobDetailSearchResult @AutomapConstructor constructor(
        val id: Long,
        val jobCategoryId: Long,
        val jobCategoryTitle: String,
        val jobTitle: String,
        val description: String,
        val desireDateTime: String,
        val prerequisite: String,
        val welcome_condition: String,
        val gift: String,
        val place: String,
//        val tags: List<Tag>?, TODO　Mybatisから取得できるように修正
        val likeFlg: Boolean,
        val helpFlg: Boolean
)

data class Tag @AutomapConstructor constructor(
        val id: Long,
        val title: String
)


