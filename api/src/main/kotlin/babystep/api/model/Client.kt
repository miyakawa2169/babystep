package babystep.api.model

import org.apache.ibatis.annotations.AutomapConstructor

//登録用
data class JobRegisterData @AutomapConstructor constructor(
        val job: Job,
        val JobDetail: JobDetail
)

//求人登録用
data class Job @AutomapConstructor constructor(
        val jobCategoryId: Long,
        val clientId: Long,
        val title: String,
        val description: String,
        val desireDateTime: String,
        val place: String
)

//求人詳細登録用
data class JobDetail @AutomapConstructor constructor(
        val description: String,
        val desireDateTime: String,
        val prerequisite: String,
        val welcomeCondition: String?,
        val gift: String?
)
