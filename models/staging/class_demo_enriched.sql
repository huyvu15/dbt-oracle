{{ config(
    materialized = 'incremental',
    unique_key = 'id'
)}}

select
    json_value(content, '$._id' returning varchar2 null on error) as id,
    json_value(content, '$.classInId' returning varchar2 null on error) as class_in_id,
    json_value(content, '$.classInSessionId' returning varchar2 null on error) as class_in_session_id,
    json_value(content, '$.code' returning varchar2 null on error) as code,
    json_value(content, '$.slotCode' returning varchar2 null on error) as slot_code,
    json_value(content, '$.learnDate' returning varchar2 null on error) as learn_date,
    json_value(content, '$.numberOfStudents' returning varchar2 null on error) as number_of_students,
    json_value(content, '$.dayOfWeek' returning varchar2 null on error) as day_of_week,
    json_value(content, '$.gender' returning varchar2 null on error) as gender,
    json_value(content, '$.maxStudentInClass' returning varchar2 null on error) as max_student_in_class,
    json_value(content, '$.status' returning varchar2 null on error) as status,
    json_value(content, '$.classTimeSlotId' returning varchar2 null on error) as class_time_slot_id,
    json_value(content, '$.gradeId' returning varchar2 null on error) as grade_id,
    json_value(content, '$.levelId' returning varchar2 null on error) as level_id,
    json_value(content, '$.monitorId' returning varchar2 null on error) as monitor_id,
    json_value(content, '$.teacherId' returning varchar2 null on error) as teacher_id,
    json_value(content, '$.updatedAt' returning varchar2 null on error) as updated_at,
    json_value(content, '$.updatedBy' returning varchar2 null on error) as updated_by,
    json_value(content, '$.createdAt' returning varchar2 null on error) as created_at,
    json_value(content, '$.createdBy' returning varchar2 null on error) as created_by,
    json_value(content, '$.isFullStudent' returning varchar2 null on error) as is_full_student,
    json_value(content, '$.hasTookTheTest' returning varchar2 null on error) as has_took_the_test,
    json_value(content, '$.booked' returning varchar2 null on error) as booked,
    json_value(content, '$.folderId' returning varchar2 null on error) as folder_id,
    json_value(content, '$.open' returning varchar2 null on error) as is_open,
    json_value(content, '$.done' returning varchar2 null on error) as is_done,
    json_value(content, '$.slotEndTime' returning varchar2 null on error) as slot_end_time,
    json_value(content, '$.slotStartTime' returning varchar2 null on error) as slot_start_time,
    json_value(content, '$.studyProgramId' returning varchar2 null on error) as study_program_id,
    json_value(content, '$.scheduleType' returning varchar2 null on error) as schedule_type,
    json_value(content, '$.saleIds._0' returning varchar2 null on error) as sale_id,
    json_value(content, '$.studentIds._0' returning varchar2 null on error) as student_id,
    json_value(content, '$.studentPhones._0' returning varchar2 null on error) as student_phone,
    INGESTED_AT
from {{ source('MONGO_RAW_TUTOR', 'CLASS_DEMO_ENRICHED') }}
{% if is_incremental() %}
where INGESTED_AT > (select max(INGESTED_AT) from {{ this }}) -- Incremental load condition
{% endif %}

