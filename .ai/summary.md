## 🤖 AI Change Summary for PR #3

### Chunk 1/1
### 개요
이 변경 사항은 GitHub Actions 워크플로우와 OpenAI API를 사용하여 Pull Request의 변경 내용을 요약하는 기능을 추가합니다. 새로운 스크립트와 프롬프트 파일이 추가되었으며, 기존의 불필요한 파일은 제거되었습니다.

### 주요 변경 사항
- **워크플로우 수정**: `.github/workflows/ai-change_summary.yml` 파일에서 스크립트 실행 후 조건문을 추가하여 요약 파일을 안전하게 처리하도록 변경.
- **프롬프트 파일 추가**: `openai-pr-summarizer/prompts/change_summary_prompt` 파일이 추가되어 요약 생성 시 사용할 프롬프트 정의.
- **스크립트 추가**: `openai-pr-summarizer/scripts/ai_change_summary.py` 파일이 추가되어 Pull Request의 변경 내용을 요약하는 기능을 구현.
- **불필요한 파일 제거**: `openai-pr-summarizer` 디렉토리 내의 불필요한 파일이 제거됨.

### 위험/영향
- **API 의존성**: OpenAI API와 GitHub API에 의존하므로, 해당 서비스의 변경이나 장애가 발생할 경우 요약 기능이 작동하지 않을 수 있음.
- **성능**: 대형 PR의 경우 요약 생성 시 시간이 소요될 수 있으며, 이로 인해 CI/CD 파이프라인의 속도에 영향을 줄 수 있음.

### 테스트/검증
- 새로운 스크립트와 워크플로우는 Pull Request 이벤트에 따라 자동으로 실행되며, 요약 파일이 생성되고 GitHub 코멘트로 게시되는지 확인해야 함.
- 다양한 크기의 PR에 대해 요약이 올바르게 생성되는지 테스트 필요.

### 후속 조치
- OpenAI API의 응답 형식이나 GitHub API의 변경 사항에 대한 모니터링 필요.
- 요약 품질을 개선하기 위한 피드백 수집 및 프롬프트 조정 필요.
