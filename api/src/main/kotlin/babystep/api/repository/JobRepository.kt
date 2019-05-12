package babystep.api.repository

import babystep.api.model.*
import org.springframework.stereotype.Repository

@Repository
interface JobRepository {

    fun registerJob(job: Job): Long

    fun registerJobDetail(jobId: Long, jobDetail: JobDetail): Long //TODO 同時更新の場合に問題ないか検討

    fun getNewestJobId(clientId: Long): Long

}