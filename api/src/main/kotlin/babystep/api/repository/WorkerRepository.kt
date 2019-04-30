package babystep.api.repository

import babystep.api.model.*
import org.springframework.stereotype.Repository

@Repository
interface WorkerRepository {

    fun findJobs(condition: FindJobsSearchCondition): List<FindJobsSearchResult>

    fun getJobDetail(condition: GetJobDetailSearchCondition): GetJobDetailSearchResult

    fun jobApplyStatusCheck(params: ApplyJobParams): List<ApplyCheck> //TODO mybatisはnullではなく、emptyListを返却してる模様

    fun applyJob(params: ApplyJobParams): Long

    fun cancelAppliedJob(params: ApplyJobParams): Long
}