package babystep.api.service

import babystep.api.model.*
import babystep.api.repository.JobRepository
import babystep.api.repository.WorkerRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
@Transactional(rollbackFor = [Throwable::class])
class ClientService(
        private val repository: JobRepository
) {

    fun registerJob(params: JobRegisterData) {
        // 求人登録
        repository.registerJob(params.job)
        // 登録した求人のid取得
        repository.getNewestJobId(params.job.clientId).let {
            // 求人詳細登録
            repository.registerJobDetail(it, params.JobDetail)
        }
    }
}