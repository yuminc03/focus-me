import Foundation

/// MBTI 유형
enum MBTI: String, CaseIterable {
  case istj
  case isfj
  case infj
  case intj
  case istp
  case isfp
  case infp
  case intp
  case estp
  case esfp
  case enfp
  case entp
  case estj
  case esfj
  case enfj
  case entj
  
  var name: String {
    return rawValue.uppercased()
  }
  
  /// 설명
  var description: String {
    switch self {
    case .istj:
      return "세상의 소금형"
    case .isfj:
      return "임금뒤편의 권력형"
    case .infj:
      return "예언자형"
    case .intj:
      return "과학자형"
    case .istp:
      return "백과사전형"
    case .isfp:
      return "성인군자형"
    case .infp:
      return "잔다르크형"
    case .intp:
      return "아이디어 뱅크형"
    case .estp:
      return "수완 좋은 활동가형"
    case .esfp:
      return "사교적인 유형"
    case .enfp:
      return "스파크형"
    case .entp:
      return "발명가형"
    case .estj:
      return "사업가형"
    case .esfj:
      return "친선도모형"
    case .enfj:
      return "언변능숙형"
    case .entj:
      return "지도자형"
    }
  }
  
  /// 캐릭터 이미지
  var image: ImageResource {
    return .charAquarius
  }
  
  /// 성향
  var disposition: String {
    switch self {
    case .istj:
      return "\(name)들은 책임감 있고, 신뢰할 만하며, 열심히 일하는 사람들로서, 자신이 말한 바를 꼭 지킨다.\n주 기능은 감각인데, 이들은 살아가면서 접하는 구체적인 사항과 세부적인 사항을 특히 잘 다룬다. 이들은 사실을 주의 깊고 정확하게 다루며, 자신이 하는 일을 신중하고 꼼꼼하게 계획하고 진행한다.\n\(name)들은 극도로 성실한 사람이며, 해야 할 일을 전부 마쳐야만 휴식시간을 갖는다. 이들은 세세한 내용에 대한 기억력이 굉장히 뛰어나기 때문에 몇 년 전에 일어났던 사소한 일까지도 놀라울 정도로 또렷하게 기억한다.\n\(name)들은 조용하고 진지한데, 다른 사람들의 방해를 받지 않거나 다른 사람들로부터 원치않는 의견을 듣지 않으면서 홀로 자신이 속도를 조절하면서 일할 때 가장 큰 행복감을 느낀다."
      
    case .isfj:
      return "\(name)들은 소속되고자 하는 욕구가 매우 강한 사람들인데, 이들은 사려 깊고 열심히 일하며 헌신하는 사람들이기 때문에 이들이 몸담기로 선택한 조직이나 집단은 매우 운이 좋다고 볼 수 있다.\n\(name)들의 주 기능은 감각인데, 이들은 자신의 모든 에너지를 지금 이 순간에 자기 앞에 놓여 있는 문제나 이슈에 집중한다.\n\(name)들은 향후 사용 할 수 있도록 자료를 수집하고 분석하며 응용하기를 좋아할 뿐만 아니라 결과물을 문서화시키기도 좋아한다. 이들은 대체적으로 매우 뛰어난 기억력을 보유하고 있으며, 어떤 사람에 관련된 날짜나 행사를 기억해내는 능력이 특히 뛰어나다. 따라서, 이들은 가족이나 사무실의 비공식적인 역사기록관 노릇을 하는 경우가 많다."
      
    case .infj:
      return "\(name)들을 가장 잘 묘사해줄 수 있는 단어가 있다면 그것은 성실성(integrity)과 독창성(originality)이다.\n주기능인 직관은 이들에게 비전과 창의성을 제공해주는데, 이들은 이 두 가지를 다른 사람들에 대해 봉사하는 데 활용할 때 가장 큰 만족을 느낀다.\n\(name)들은 타인의 말을 경청하는 능력이 탁월한 경우가 많으며, 인내심이 많고 도움을 주기를 좋아한다. 이들은 통찰력이 극도로 뛰어나고 감정이입을 잘하는데, 다른 사람들이 그들의 욕구를 충족시킬 수 있는 새롭고 더 나은 방법을 찾아내서 도와주는 능력을 타고 났으며, 다른 사람들이 어떠한 도움을 필요로 한다고 해도 도와주고 싶어 한다.\n\(name)들은 전형적으로 점잖고 상냥한 말씨로 이야기를 하며, 자신에게 관심이 쏟아지는 것을 좋아하지 않으며, 막후에서 일하는 데 만족하는 경우가 많다."
      
    case .intj:
      return "\(name)들은 독창적인 머리로 총체적인 사고를 하는 사람들이다.\n이들의 주기능인 직관은 이들이 현재의 행동과 사건들 사이의 연관관계를 찾아내고, 그러한 행동과 사건이 장기적으로 어떠한 의미를 가져올 것인지를 이해할 수 있게 만들어준다. 독창성이 뛰어나고 혁신적인데, 어떠한 것이 되었든지 그것을 개 선시키는 방법을 찾아내는 독특한 재능을 보유하고 있다. 그러한 재능은 아주 제품이나 서비스를 사소하게 개선하는 일에서부터 조직의 시스템 전체를 재구성하고 정교화시키는 비전을 수립하는 일에 이르기까지 광범위하게 발휘된다. 하지만, 이들이 개선시키기 가장 원하는 대상은 바로 자기 자신인데, 지식을 향상 및 확장시켜 궁극적으로는 전반적인 실력을 향상시키기 위해 끊임없는 노력을 기울인다."
      
    case .istp:
      return "\(name)들은 매두 실용적인 사람들로서, 독립적이고 속내를 잘 털어놓지 않으며 때때로 초연한 태도를 취한다.\n이들은 모든 세상사에 대해 극도로 냉정하고 객관적인 사람들이며, 감정의 기복이 없고 침착하다.\n위기 상황이나 매우 불안한 상황에서도 그 순간에 요구되는 것이 무엇인지에 초점을 맞추는 능력을 지니고 있으며, 자신의 주기능인 사고를 적용하여 능숙하고 신속하게 문제를 해결한다. 상황이 전개되면서 발생하는 어려운 문제들에 자발적으로 대응하는 일에 자신의 능력을 최대로 발휘하며, 일에 대한 논의나 미리 계획을 세우는 일은 생략하고 바로 행동으로 옮기는 것을 좋아한다. '일단 급한 불을 끄고 나면' 이들은 그 일을 완벽하게 마무리할 만한 에너지가 남아 있지 않은 상태가 되며, 다른 사람들로부터 칭찬을 받고 싶어 하는 욕구도 그다지 강하지 않다."
      
    case .isfp:
      return "\(name)들은 부드럽고 민감하며 동정심이 많은데, 이들은 모든 성격유형들 중에서 가장 겸손하고 솔직한 사람들일 것이다.\n이들은 전형적으로 말수가 적은데, 말보다는 행동을 통해서 자신의 친구와 가족 그리고 자신의 가슴에 와 닿는 대의명분에 대한 헌신과 충성심을 보여준다.\n\(name)들은 점잖고 자신을 잘 드러 내지 않는 사람인데, 주기능이 감정인 이들은 모든 세상사를 개인적으로 받아들이고 느낀다. 이들은 다른 사람들의 고통이나 불행 또는 불운에 대해 깊은 감정을 느끼지만, 냉정하고 거리감이 있는 것처럼 보이는 초연한 모습 이면에 쉽게 상처를 받는 자신의 특성을 감추고 있는 경우가 많다.\n\(name)들은 매우 비밀이 많고 극소수의 사람에게만 자신의 비밀을 털어놓기 때문에, 이들을 알게 되기까지는 많은 시간이 걸릴 수 있다."
      
    case .infp:
      return "\(name)들은 평생에 걸쳐 의미와 내면의 조화를 추구한다.\n이들의 주기능은 감정이기 때문에 자기 내면 깊숙이 느끼고 있는 개인적인 가치관에 입각하여 행동하며, 자신의 신념과 일치하는 행동을 하기 위하여 열정적으로 헌신한다.\n\(name)들은 진정성과 개인적 성실성을 유지하려는 욕구가 매우 강하기 때문에 자기 마음속으로 옳다고 믿고 있지 않은 일은 결코 하지 못한다. 이들은 민감하고 다른 사람들을 잘 돌봐주기 때문에 다른 사람들에게 감정이입을 잘 하며, 자신과 가깝다고 느끼는 사람들을 잘 보살펴주고 편안하게 해준다. 하지만, 이들은 극소수의 사람들에게만 자신의 내면 세계에 들어오도록 허락하기 때문에, 자신이 잘 알지 못하는 사람들에게 다소 냉정하고 거리감이 있으며 무관심한 것처럼 보일 수 있다."
      
    case .intp:
      return "\(name)들의 주기능은 내향적 사고이기 때문에 이들은 고도로 논리적이고 분석적인 사람들이다.\n이들은 자신의 머릿속에서 개념과 관념 그리고 문제 등을 다각도로 생각해보는 능력이 가장 뛰어나다. 금고 자물쇠의 정확한 숫자의 조합을 찾아내듯이 완벽한 해결책이나 접근방법을 찾아내기 위해 노력한다.\n\(name)들은 초연하고 지적이며 복잡한 사람들인데, 점점 더 어려워지는 창의적인 과제를 추구해 나간다.\n\(name)들은 독립적이고 의심이 많으며 때때로 명석한 경우가 많은데, 자신감을 타고난 사람들이다. 이들은 어떠한 문제라도 논리적으로 접근해서 풀어낼 수 있는 자신감을 내면에 지니고 있다. 이들은 위기상황에서도 일반적으로 전혀 흔들림이 없고 놀라울 정도의 침착성과 평정심을 유지하는데, 극복하기가 거의 불가능해 보이는 난관에 봉착했을 때에도 그러하다."
      
    case .estp:
      return "\(name)들에게 인생은 재미있는 일들로 가득찬 모험이다.\n이들은 활동적이고 호기심이 많으며 장난기가 많은데, 이들의 주기능은 감각이기 때문에 자기 주변에 있는 모든 것들을 인지하고 삶의 모든 물리적 측면에 활발하게 참여한다.\n\(name)들은 대응력과 적응력이 뛰어난데, 결과에 대해 거의 생각해보지 않고서 일단 행동으로 옮기고 본다. 특히 이들은 자신의 행동이 장기적으로 어떠한 의미를 가져오고 다른 사람들에게 어떤 영향을 미칠 것인지를 고려하는 경우가 드물다. 이들은 매우 현실적이지만 충동적이기 때문에 자기 눈앞에 흥미진진한 기회가 펼쳐질 때마다 그것을 즉시 포착해낸다.\n\(name)들은 관찰력이 매우 뛰어난데, 이들은 자기 주변의 환경과 사람들을 끊임없이 자세히 살피면서 자신이 인지한 감각적 정보들을 있는 그대로 전부 받아들인다."
      
    case .esfp:
      return "\(name)들은 다른 사람들을 놀라게 하고 즐겁게 만들어주는 연예인 기질을 타고난 사람들이다.\n이들은 따뜻하고 사교적이며 친근한 사람들인데, 대개 명랑하고 말이 많다.\n\(name)들은 사람들을 많이 알고 있으며, 다른 사람들이 자신에게 잘 대해주기만 한다면 모든 사람들을 똑같이 다 좋아한다. 이들은 재미를 추구하며 생기발랄한데, 행동의 중심에 서기를 좋아하며, 사교적이고 낙관적이며 사려 깊은 사람들과 함께 어울리면서 웃고 대화하고 공통된 관심사나 활동을 함께 하기를 좋아한다.\n\(name)들은 열의가 있고 기운차며, 사교적이고 자발적인 사람들인데, 이들은 너무 쉽게 주의가 분산되기 때문에 일에 본격적으로 착수하거나 일을 마무리 짓는 데 어려움을 겪을 수 있다."
      
    case .enfp:
      return "\(name)들은 가능성에 의해 움직이는 사람들이다.\n이들은 주기능이 직관이기 때문에 현재 눈앞에 놓은 뻔한 것을 넘어서서 사물에 대한, 특히 사람들에 대한 가능성을 볼 수밖에 없는 사람들이다. 이들은 만족할 줄 모르는 호기심을 지니고 있어서 관심사가 매우 다양하다.\n\(name)들은 열성적이고 우호적이며 활 력이 넘치는 사람이며, 일반적으로 재미있는 일을 좋아하는데, 그럼에도 불구하고 어떠한 일을 하더라도 거기에서 의미를 찾는 사람이다.\n\(name)들은 인습에 얽매이지 않고 때로는 버릇없어 보이기도 하는데, 권위나 규칙을 중시하는 경우가 드물다.\n\(name)의 가장 뛰어난 재능 중 하나는 불가능한 일이란 없다고 생각하는 믿음이다. 가능성을 브레인스토밍하고 다른 창의적인 사람들과 아이디어를 주고받는 일은 이들이 가장 좋아하는 소일거리 중 하나이다."
      
    case .entp:
      return "\(name)들은 자신에 대해 멋진 인상을 심어주는 데 능하며, 자신이 제시한 아이디어에 다른 사람들이 열광하도록 만드는 천부적인 재능을 타고났다.\n 매력적이고 사교적이며 친근한 경우가 많은데, 통찰력이 매우 뛰어나며 거의 모든 종류의 사람들과 의사소통하는 데 능하다.\n\(name)의 주기능은 직관인데, 큰 그림을 읽어내고 추세를 예측하는 능력이 있으며, 뛰어난 자신감으로 적정 수준의 위험을 감수하곤 한다. 자신의 열의를 다른 사람들에게 감염시키고 뛰어난 협상 능력을 보유하고 있기 때문에, 자신들이 추진하는 혁신적이고 때때로 성공적인 모험사업에 다른 사람들이 참여하도록 설득하는 능력을 갖고 있다. 많은 \(name)들에게 있어서, 어떤 목표를 직접 손에 넣는 일보다는 그러한 목표를 손에 넣기 위해 노력하는 과정에서 느끼는 스릴이 결정적으로 중요하며, \(name)들은 그러한 과정에 신바람을 내고 활력을 얻으며 만족감을 느낀다."
      
    case .estj:
      return "\(name)들은 완벽한 프로젝트 관리자이다.\n완수해야 할 과업의 성격에 상관없이 그리고 어떠한 일을 직업적으로 하든지 아니면 재미로 하든지에 상관없이, 주기능이 사고인 \(name)들은 상황을 한 눈에 파악하고, 목표를 세우며, 활용할 수 있는 자원을 정하고, 일을 정확히 완수할 수 있도록 사람들을 구성하여 감독 하며, 가장 능률적인 방식으로 일을 완수해낸다.\n\(name)들은 논리적이고 분석적인데, 이들은 타고난 리더이며 신속하게 의사결정을 한다. 이들은 진지하고 현실적으로 삶에 접근하기 때문에 함께 일하는 사람들 이나 함께 생활하는 사람들에게 자신감을 불어넣고 그들로부터 신뢰를 얻는다.\n\(name)들은 객관적이고 편견 없이 공정하기 때문에 다른 사람들로부터 존경을 받는데, 열심히 일하며 올바르고 윤리적으로 행동해야 한다는 규범을 가지고 움직인다."
      
    case .esfj:
      return "'필요할 때 도움을 주는 친구가 진정한 친구이다.'라는 말을 가장 잘 믿는 사람들이 아마도 \(name)일 것이다.\n왜냐하면, 도움이 필요한 사람을 도와주겠다고 가장 먼저 자원하는 사람들이 \(name)이기 때문이다. 상냥하고, 사교적이며, 동정심이 많은 이들의 주기능은 감정인데, 이로 인해 극도로 민감하고, 다른 사람들을 즐겁게 해주고자 하는 욕구가 매우 강하며, 다른 사람들이 자신을 좋아해 주고 인정해주기를 바라는 욕구도 그에 못지않게 강하다.\n\(name)는 관대하고 충성스러운데, 자신의 가족과 친구들을 그 누구보다도 소중하게 생각하는 전통적인 사람이다. 이들은 자선단체, 지역사회 기관, 종교단체 등 지역 사회에 봉 사하는 기관이 운영하는 프로그램에 헌신하면서 많은 시간을 투자하곤 한다."
      
    case .enfj:
      return "\(name)들에게는 다른 사람들과 조화로운 관계를 유지하는 것이 일생의 목적일 뿐만 아니라 조화로운 관계를 맺는 것이 이들의 타고난 능력이며 갈고 닦을 수 있는 기술이다.\n이들의 주기능은 감정이기 때문에 다른 사람들의 감정을 잘 이해할 수 있으며, 다른 사람들을 기쁘게 만들어주고 싶어 하는 욕구가 강하다.\n\(name)들은 따뜻하고 동정심 있으며 친근한데, 다른 사람들의 감정을 아주 잘 이해하기 때문에 타인의 욕구-특히 감정적 욕구-가 무엇인지를 잘 알아낸다. 또한 이들은 사람들이 개인적인 문제를 창의 적으로 해결하도록 도와주는 데 탁월하다.\n\(name)들은 자신의 생각을 잘 표현하고 명랑하며 열성적인데, 이들은 청중이 원하는 것을 읽어내는 탁월한 감각을 지니고 있어서 뛰어난 대중 연설가인 경우가 많다."
      
    case .entj:
      return "\(name)들은 타고난 지도자인데, 이들은 자신의 실력과 강점을 활용하여 다른 사람들에게 확신감을 심어주고 다른 사람들로부터 존경을 받는다.\n이들의 주기능인 사고는 문제를 논리적이고 객관적으로 분석하게 해주며, 어떠한 이슈의 장점과 단점을 저울질하게 해주고, 능률적이고 합당하며 때때로 어려운 의사 결정을 내릴 수 있게 해준다.\n\(name)들은 정직성과 솔직성을 소중하게 여기며, 에두른 표현을 하기보다는 요점을 곧바로 적시하고 들어간다. 하지만 \(name)들의 열등기능은 감정이기 때문에 자신의 행동이 다른 사람들에게 미치는 영향을 의식하지 못할 수 있다. 실제로, 많은 \(name)들은 감정의 세계와는 동떨어져 지내는 경우가 자주 있기 때문에 다른 사람들의 욕구나 감정에 둔감하게 행동할 수도 있다."
    }
  }
  
  /// 강점
  var strength: [String] {
    switch self {
    case .istj:
      return [
        "정밀성과 정확성 그리고 처음부터 일을 정확하게 하고자 하는 욕구",
        "전통적인 구조의 가치에 대한 믿음과 전통적 구조 내에서 일을 수행해내는 능력",
        "책임감. 자신이 말한 바는 반드시 행동에 옮기는 사람이라고 믿을 만함"
      ]
      
    case .isfj:
      return [
        "강한 근로윤리. 책임감이 강하고 열심히 일함",
        "전통적인 구조 내에서 일하는 것을 가치 있게 여기고 충성심이 강함",
        "기존에 확립되어 있는 방식으로 일하는 것을 즐기며, 사람들이 부여 받은 지위를 존중함"
      ]
      
    case .infj:
      return [
        "성실성(도덕성)을 바탕으로 사람들을 감화시켜 자신의 생각을 받아들이게 하는 능력",
        "자신에게 중요하게 생각되는 일에 초점을 맞추고 몰두하는 능력",
        "타인에 대한 진정한 관심과 타인이 성장하고 발전할 수 있도록 도와주는 능력"
      ]
      
    case .intj:
      return [
        "창의적으로 문제를 해결하는 능력과 이슈를 객관적으로 검토하는 능력",
        "실력을 갖추고자 하는 강한 동기와 탁월성을 지향하는 욕구",
        "논리적이고 분석적인 의사결정 기술"
      ]
      
    case .istp:
      return [
        "명확하게 정의된 일과 유형적인 결과를 가져오는 일을 잘 수행해내는 능력",
        "위기상황이나 압박을 받는 상황에서도 침착함과 냉정함을 유지할 수 있는 능력",
        "위험을 감수하고 새로운 접근법을 취하고자 하는 융통성과 의지"
      ]
      
    case .isfp:
      return [
        "변화를 기꺼이 받아들이고 새로운 상황에 잘 적응하는 능력",
        "자신이 깊은 관심을 갖고 있는 사람들과 조직에 대한 충성심",
        "현재의 상황을 명확하게 평가하고 고쳐할 것을 파악해내는 능력"
      ]
      
    case .infp:
      return [
        "고정관념을 탈피하여 새로운 가능성을 모색하고자 하는 욕구",
        "큰 그림을 보고 행동과 아이디어가 가져다 줄 의미를 알아내는 능력",
        "적응력. 신속하게 방향을 전환하고 방법을 바꾸는 능력"
      ]
      
    case .intp:
      return [
        "매우 복잡하고 고도로 추상적인 관념을 이해하는 능력",
        "독립성. 모험을 하고 새로운 일을 시도하며 장애를 극복할 수 있는 용기",
        "타고난 호기심과 자신에게 필요한 정보를 획득하는 기술"
      ]
      
    case .estp:
      return [
        "매력적으로 행동하고 다른 사람들과 쉽게 사귐",
        "일을 재미있고 흥미진진한 것으로 만드는 능력",
        "과정 중심적인 접근을 취하기 때문에 생동감 있고 재미있는 업무 분위기를 조성함"
      ]
      
    case .esfp:
      return []
      
    case .enfp:
      return []
      
    case .entp:
      return []
      
    case .estj:
      return []
      
    case .esfj:
      return []
      
    case .enfj:
      return []
      
    case .entj:
      return []
    }
  }
  
  /// 약점
  var weakPoint: [String] {
    switch self {
    case .istj:
      return [
        "검증되지 않은 새로운 아이디어를 포용하기 주저함",
        "융통성이 부족함. 적응이 필요할 경우에도 적응하고자 하는 능력이나 의지가 없음",
        "큰 그림에 초점을 맞추지 못하며 어떠한 행동이 가져올 함축된 의미를 읽지 못함"
      ]
      
    case .isfj:
      return [
        "자신의 가치를 낮추는 경향이 있으며, 자신이 원하는 것을 강하게 주장하지 못하는 경향이 있음",
        "비판에 민감함. 긴장이 감도는 업무 상황에서 스트레스를 많이 받음",
        "함축된 의미와 미래에 초점을 맞추기보다는 세부사항과 현재에 초점을 맞추고자 하는 욕구가 강함"
      ]
      
    case .infj:
      return [
        "한 가지에만 몰두함으로써 융통성이 부족할 수 있음",
        "자신의 가치관과 배치되는 일을 수행하기를 어려워함",
        "아이디어의 실현 가능성 또는 실행 가능성을 현실적으로 생각하지 못하는 경향이 있음"
      ]
      
    case .intj:
      return [
        "자기 자신을 거세게 몰아붙이는 것과 똑같이 다른 사람들을 몰아붙임",
        "일에 쫓길 때 퉁명스런 태도를 취하며 타인의 감정을 상하지 않게 하는 기지와 외교적 능력이 부족",
        "일부 직업에서 요구하는 '대인관계상의 섬세함'을 견디지 못함"
      ]
      
    case .istp:
      return [
        "미리 준비하는 것을 좋아하지 않기 때문에 시간을 배분하는 데 문제가 발생할 수 있음",
        "다른 사람에게 퉁명스럽게 대하고 다른 사람들의 감정에 민감하지 못한 경향이 있음",
        "독립적인 태도가 매우 강하며, 과도한 규칙과 구조화된 관료적 절차를 싫어함"
      ]
      
    case .isfp:
      return [
        "비판과 부정적인 피드백을 개인에 대한 인신공격으로 받아들이는 경향이 강함",
        "결정을 내리는 데 어려움을 겪음",
        "다른 사람들과 조화를 이루지 못할 위험을 감수하려고 하지 않기 때문에 자신의 생각이나 입장을 관철시키기 위해 싸우고자 하는 의지가 없음"
      ]
      
    case .infp:
      return [
        "진행하고 있는 일을 통제하지 않으면 관심을 잃을 수 있음",
        "이상적으로 생각하는 특성을 타고났기 때문에 현실적인 기대를 하지 못할 수 있음",
        "너무 경직된 시스템이나 사람들 속에서 일하는 것을 견디지 못함"
      ]
      
    case .intp:
      return [
        "과도한 자신감. 자신의 능력이나 경험을 부풀려 소개할 수 있음",
        "문제가 해결된 일에 대해서는 관심을 잃게 되는 경향이 있음",
        "너무 이론에 치우쳐서 현실을 무시하거나 고려하지 못하는 경향이 있음"
      ]
      
    case .estp:
      return [
        "사람들의 감정을 너무 가볍게 여기는 경향이 있으며, 때때로 사람들에게 퉁명스럽고 둔감할 수 있음",
        "행정적인 세부사항과 절차를 견디지 못함",
        "충동적인 경향이 있으며 쉽게 유혹에 빠지거나 주의가 분산되는 경향이 있음"
      ]
      
    case .esfp:
      return []
      
    case .enfp:
      return []
      
    case .entp:
      return []
      
    case .estj:
      return []
      
    case .esfj:
      return []
      
    case .enfj:
      return []
      
    case .entj:
      return []
      
    }
  }
  
  /// 조언
  var advice: String {
    switch self {
    case .istj:
      return "여러 가지 가능성을 받아들이세요. 어떤 일이 사람들에게 미칠 의미를 고려하세요. 변화를 포용해주세요."
      
    case .isfj:
      return "자기주장을 하세요. 현재 존재하지 않는 것의 가능성을 고려하세요. 좀 더 융통성을 갖고 계획 없이도 행동할 수 있도록 노력해주세요."
      
    case .infj:
      return "세부사항에 주의를 기울이세요. 좀 더 융통성을 발휘해보세요. 계획이 없어도 자연스럽게 행동하세요."
      
    case .intj:
      return "실제적인 현실을 고려하세요. 다른 사람이 내는 의견의 가치를 인정해주세요. 직장 생활과 개인 생활의 균형을 유지하세요."
      
    case .istp:
      return "다른 사람들과 대화하세요. 사람들의 감정을 고려하세요. 자신이 하겠다고 한 일은 철저하게 마무리해주세요."
      
    case .isfp:
      return "자기주장을 하세요. 한 걸음 물러서서 큰 그림에 대해 생각해 보세요. 매사를 너무 개인적으로 받아들이지 말아주세요."
      
    case .infp:
      return "현실적인 기대를 하세요. 현실과의 타협을 중시하세요. 매사를 너무 개인적인 것으로 받아들이지 말아주세요."
      
    case .intp:
      return "좀 더 조직적으로 행동하세요. 자신보다 지적 수준이 낮은 사람도 포용하세요. 대인관계를 개선하도록 노력해주세요."
      
    case .estp:
      return "행동하기 전에 먼저 생각하세요. 사람들의 감정을 고려해주세요. 자신이 하겠다고 한 일은 철저하게 마무리하세요."
      
    case .esfp:
      return ""
      
    case .enfp:
      return ""
      
    case .entp:
      return ""
      
    case .estj:
      return ""
      
    case .esfj:
      return ""
      
    case .enfj:
      return ""
      
    case .entj:
      return ""
    }
  }
}
