package babystep.api.repository

import babystep.api.model.FindJobsSearchCondition
import babystep.api.model.FindJobsSearchResult
import babystep.api.model.GetJobDetailSearchCondition
import babystep.api.model.GetJobDetailSearchResult
import org.springframework.stereotype.Repository

@Repository
interface WorkerRepository {

    fun findJobs(condition: FindJobsSearchCondition): List<FindJobsSearchResult>

    fun getJobDetail(condition: GetJobDetailSearchCondition): GetJobDetailSearchResult

}