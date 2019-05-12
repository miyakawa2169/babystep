package babystep.api.controller

import babystep.api.exception.ValidationException
import babystep.api.model.*
import babystep.api.service.ClientService
import babystep.api.service.WorkerService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/client")
class ClientRestController(
        private val service: ClientService
) {

    // 求人登録前確認API
    @PostMapping("/jobs/check")
    fun checkJob(
            @RequestParam(name = "clientId", required = true) clientId: Long,
            @RequestBody form: ClientJobRequestForm
    ) {
        form.validateFormData()
    }

    // 求人登録API
    @PostMapping("/jobs/register")
    fun registerJob(
            @RequestParam(name = "clientId", required = true) clientId: Long,
            @RequestBody form: ClientJobRequestForm
    ) {
        form.let{
            it.validateFormData()
            JobRegisterData(
                    job = Job(
                            jobCategoryId = form.jobCategoryId,
                            clientId = form.clientId,
                            title = form.title,
                            description = form.description,
                            desireDateTime = form.desireDateTime,
                            place = form.place
                    ),
                    JobDetail = JobDetail(
                            description = form.detailDescription,
                            desireDateTime = form.detailDesireDateTime,
                            prerequisite = form.detailPrerequisite,
                            welcomeCondition = form.detailWelcomeCondition,
                            gift = form.detailGift
                    )
            ).let { jobRegisterData ->
                service.registerJob(jobRegisterData)
            }
        }
    }

    data class ClientJobRequestForm(
            val jobCategoryId: Long,
            val clientId: Long,
            val title: String,
            val description: String,
            val desireDateTime: String,
            val place: String,
            val detailDescription: String,
            val detailDesireDateTime: String,
            val detailPrerequisite: String,
            val detailWelcomeCondition: String?,
            val detailGift: String?
    ) {
        // 入力値バリデーションチェック
        fun validateFormData() {
            mutableMapOf<String, String>().also {
                if (title.isBlank()) {
                    it[ClientJobRequestForm::title.name] = ValidationException.required()
                } else if (description.isBlank()) {
                    it[ClientJobRequestForm::description.name] = ValidationException.required()
                } else if (desireDateTime.isBlank()) {
                    it[ClientJobRequestForm::desireDateTime.name] = ValidationException.required()
                } else if (place.isBlank()) {
                    it[ClientJobRequestForm::place.name] = ValidationException.required()
                } else if (detailDescription.isBlank()) {
                    it[ClientJobRequestForm::detailDescription.name] = ValidationException.required()
                } else if (detailDesireDateTime.isBlank()) {
                    it[ClientJobRequestForm::detailDesireDateTime.name] = ValidationException.required()
                } else if (detailPrerequisite.isBlank()) {
                    it[ClientJobRequestForm::detailPrerequisite.name] = ValidationException.required()
                }
            }.throwIfNotEmpty()
        }
    }
}

private fun Map<String, String>.throwIfNotEmpty(reason: String? = null) {
    if (this.isNotEmpty() || reason != null) {
        throw ValidationException(this, reason)
    }
}
